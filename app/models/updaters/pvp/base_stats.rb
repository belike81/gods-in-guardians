class Updaters::Pvp::BaseStats
  def initialize(users, stats)
    @users, @stats = users, stats
  end

  def update
    @users.each do |user|
      user.pvp_base_stat.destroy
      ::PvpBaseStat.create({
                            user: user,
                            kills: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['kills']['basic']['value'],
                            deaths: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['deaths']['basic']['value'],
                            kd: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['killsDeathsRatio']['basic']['value'],
                            suicides: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['suicides']['basic']['value'],
                            assists: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['assists']['basic']['value'],
                            most_kills: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['bestSingleGameKills']['basic']['value']
                          })
    end
  end
end
