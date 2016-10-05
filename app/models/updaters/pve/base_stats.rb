class Updaters::Pve::BaseStats
  def initialize(users, stats)
    @users, @stats = users, stats
  end

  def update
    @users.each do |user|
      user.pve_base_stat.destroy if user.pve_base_stat
      ::PveBaseStat.create({
                            user: user,
                            kills: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['kills']['basic']['value'],
                            deaths: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['deaths']['basic']['value'],
                            kd: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['killsDeathsRatio']['basic']['value'],
                            suicides: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['suicides']['basic']['value'],
                            assists: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['assists']['basic']['value'],
                            most_kills: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['bestSingleGameKills']['basic']['value']
                          })
    end
  end
end
