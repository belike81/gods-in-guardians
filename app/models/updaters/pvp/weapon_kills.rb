class Updaters::Pvp::WeaponKills
  def initialize(users, stats)
    @users, @stats = users, stats
  end

  def update
    @users.each do |user|
      begin
        unless @stats[user.id].nil? || @stats[user.id]['mergedAllCharacters']['results']['allPvP'].empty?
          user.pvp_kills_weapon.destroy if user.pvp_kills_weapon
          ::PvpKillsWeapon.create({
            user: user,
            super: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsSuper']['basic']['value'],
            granade: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsGrenade']['basic']['value'],
            melee: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsMelee']['basic']['value'],
            auto_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsAutoRifle']['basic']['value'],
            fusion: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsFusionRifle']['basic']['value'],
            hand_canon: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsHandCannon']['basic']['value'],
            pulse_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsPulseRifle']['basic']['value'],
            rocket_launcher: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsRocketLauncher']['basic']['value'],
            scout_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsScoutRifle']['basic']['value'],
            shotgun: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsShotgun']['basic']['value'],
            sniper: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsSniper']['basic']['value'],
            side_arm: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsSideArm']['basic']['value'],
            sword: @stats[user.id]['mergedAllCharacters']['results']['allPvP']['allTime']['weaponKillsSword']['basic']['value'],
          })
        end
      rescue => e
        puts "Something wrong with import: #{e}"
      end
    end
  end
end
