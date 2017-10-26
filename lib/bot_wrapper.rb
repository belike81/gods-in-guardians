class BotWrapper
  def initialize(client = DiscordClientWrapper.client)
    @client = client
  end

  def run
    @client.command :nowy do |event, name, start_date, start_time, limit|
      limit != 6
      created_event = Event.create(name: name, start_date: start_date, start_time: start_time, limit: limit)
      if created_event.valid?
        EventUser.create(name: event.user.name, event_id: created_event.id)
        "Dodano wydarzenie #{name}, ID - #{created_event.id}"
      else
        "Nie udało się dodać wydarzenia #{name}" + created_event.errors.full_messages.join("\n")
      end
    end

    @client.command :anuluj do |event_id|
      found_event = Event.find(event_id)
      if found_event
        found_event.destroy
        "Usunięto wydarzenie #{found_event.name}"
      else
        "Nie udało się usunąć wydarzenia #{found_event.name}"
      end
    end

    @client.command :lista do |event|
      events_list = Array.new
      Event.current.by_closest.each_with_index do |list_event, index|
        events_list << "#{index+1}. #{event_title(list_event)}"
      end
      if events_list.count > 0
        events_list.join("\n")
      else
        "Nie dodano jeszcze żadnych wyradarzeń"
      end
    end

    @client.command :pokaz do |event, event_id|
      found_event = Event.find(event_id)
      if found_event
        user_list = Array.new
        found_event.event_users.each_with_index do |user, index|
          user_list << "#{index+1}. #{user.name}"
        end

        event_title(found_event) + "\n" + user_list.join("\n")
      else
        "Nie znalazłem wydarzenia o podanym ID"
      end
    end

    @client.command :dodaj do |event, event_id|
      found_event = Event.find(event_id)
      if found_event
        return "Nie ma już miejsca dla tego wydarzenia" if event_limit_reached(found_event)
        user = EventUser.create(name: event.user.name, event_id: found_event.id)
        if user.valid?
          "Dodano #{event.user.name} do #{event_title(found_event)}"
        else
          "Nie udało się dodać #{event.user.name} do wydarzenia #{event_title(found_event)}" +
            user.errors.full_messages.join("\n")
        end
      else
        "Nie znalazłem wydarzenia o podanym ID"
      end
    end

    @client.command :usun do |event, event_id|
      found_event = Event.find(event_id)
      if found_event
        user = EventUser.where(name: event.user.name, event_id: found_event.id).first
        if user.destroy
          "Usunięto #{event.user.name} z #{event_title(found_event)}"
        else
          "Nie udało się usunąć #{event.user.name} z wydarzenia #{event_title(found_event)}"
        end
      else
        "Nie znalazłem wydarzenia o podanym ID"
      end
    end

    @client.command :moje do |event|
      my_events = Event.for_user(event.user.name).current.by_closest
      if my_events.count > 0
        events_list = Array.new
        my_events.each_with_index do |list_event, index|
          events_list << "#{index+1}. #{event_title(list_event)}"
        end

        "#{event.user.name} jest zapisany do:\n" + events_list.join("\n")
      else
        "Nie jesteś zapisany do żadnego wydarzenia"
      end
    end
    @client.run :async
  end

  private

  def event_title(list_event)
    limit_left = list_event.limit - list_event.event_users.count
    "#{list_event.name} zaplanowany na #{list_event.start_date.strftime("%m/%d")} #{list_event.start_time.strftime("%H:%M")}, wolne miejsca: #{limit_left} [##{list_event.id}]"
  end

  def event_limit_reached(event)
    (event.limit == event.event_users.count) ? true : false
  end
end
