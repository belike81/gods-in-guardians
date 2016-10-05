class Updaters::Pve::WeaponKills
  def initialize(users, stats)
    @users, @stats = users, stats
  end

  def update
    @users.each do |user|
      user.pve_kills_weapon.destroy if user.pve_kills_weapon
      ::PveKillsWeapon.create({
                              user: user,
                              super: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsSuper']['basic']['value'],
                              granade: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsGrenade']['basic']['value'],
                              melee: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsMelee']['basic']['value'],
                              auto_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsAutoRifle']['basic']['value'],
                              fusion: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsFusionRifle']['basic']['value'],
                              hand_canon: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsHandCannon']['basic']['value'],
                              machine_gun: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsMachinegun']['basic']['value'],
                              pulse_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsPulseRifle']['basic']['value'],
                              rocket_launcher: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsRocketLauncher']['basic']['value'],
                              scout_rifle: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsScoutRifle']['basic']['value'],
                              shotgun: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsShotgun']['basic']['value'],
                              sniper: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsSniper']['basic']['value'],
                              side_arm: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsSideArm']['basic']['value'],
                              sword: @stats[user.id]['mergedAllCharacters']['results']['allPvE']['allTime']['weaponKillsSword']['basic']['value'],
                            })
    end
  end
end
