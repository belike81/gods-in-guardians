class Updaters::Pvp::BaseStats
  def initialize(users, stats)
    @users, @stats = users, stats
  end

  def update
    @users.each do |user|
      unless @stats[user.id].nil? || @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP'].empty?
        user.pvp_base_stat.destroy if user.pvp_base_stat
        ::PvpBaseStat.create({
                               user: user,
                               kills: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['kills']['basic']['value'],
                               kills_assists: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['killsDeathsAssists']['basic']['value'],
                               games: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['activitiesEntered']['basic']['value'],
                               deaths: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['deaths']['basic']['value'],
                               kd: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['killsDeathsRatio']['basic']['value'],
                               suicides: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['suicides']['basic']['value'],
                               assists: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['assists']['basic']['value'],
                               most_kills: @stats[user.id]['Response']['mergedAllCharacters']['results']['allPvP']['allTime']['bestSingleGameKills']['basic']['value']
                             })
      end
    end
  end
end
