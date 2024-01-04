// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace bb;

// Namespace bb/bb
// Params 0, eflags: 0x5
// Checksum 0xa016e7eb, Offset: 0x118
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"bb", &function_70a657d8, undefined, undefined, undefined);
}

// Namespace bb/bb
// Params 0, eflags: 0x6 linked
// Checksum 0xe6d3bca9, Offset: 0x160
// Size: 0x54
function private function_70a657d8() {
    init_shared();
    callback::on_spawned(&on_player_spawned);
    callback::on_player_killed(&on_player_death);
}

// Namespace bb/bb
// Params 0, eflags: 0x2 linked
// Checksum 0x53a98d83, Offset: 0x1c0
// Size: 0x84
function on_player_spawned() {
    self._bbdata = [];
    self._bbdata[#"score"] = 0;
    self._bbdata[#"momentum"] = 0;
    self._bbdata[#"spawntime"] = gettime();
    self._bbdata[#"shots"] = 0;
    self._bbdata[#"hits"] = 0;
}

// Namespace bb/bb
// Params 1, eflags: 0x2 linked
// Checksum 0x3ebc7a9f, Offset: 0x250
// Size: 0x2ac
function function_bf5cad4e(gamemodedata) {
    matchtime = (isdefined(level.var_8a3a9ca4.roundend) ? level.var_8a3a9ca4.roundend : 0) - (isdefined(level.var_8a3a9ca4.roundstart) ? level.var_8a3a9ca4.roundstart : 0);
    firstblood = (isdefined(level.var_8a3a9ca4.firstblood) ? level.var_8a3a9ca4.firstblood : 0) - (isdefined(level.var_8a3a9ca4.roundstart) ? level.var_8a3a9ca4.roundstart : 0);
    alliesscore = isdefined([[ level._getteamscore ]](#"allies")) ? [[ level._getteamscore ]](#"allies") : 0;
    axisscore = isdefined([[ level._getteamscore ]](#"axis")) ? [[ level._getteamscore ]](#"axis") : 0;
    var_5e25b17b = abs(alliesscore - axisscore);
    gamemodedata = {};
    gamemodedata.gamemode.gamemodedata = level.gametype;
    gamemodedata.wintype.gamemodedata = isdefined(gamemodedata.wintype) ? gamemodedata.wintype : "NA";
    gamemodedata.matchtime = matchtime;
    gamemodedata.firstblood = firstblood;
    gamemodedata.var_5e25b17b = var_5e25b17b;
    gamemodedata.timeremaining.gamemodedata = isdefined(gamemodedata.remainingtime) ? gamemodedata.remainingtime : 0;
    gamemodedata.var_20de6a02.gamemodedata = isdefined(gamemodedata.var_20de6a02) ? gamemodedata.var_20de6a02 : 0;
    gamemodedata.var_be1de2ab.gamemodedata = isdefined(gamemodedata.var_be1de2ab) ? gamemodedata.var_be1de2ab : 0;
    function_92d1707f(#"hash_1a63efe7c6121b24", gamemodedata);
}

// Namespace bb/bb
// Params 5, eflags: 0x0
// Checksum 0x46b2cff6, Offset: 0x508
// Size: 0x194
function function_95a5b5c2(var_daec1817, label, team, origin, player) {
    if (sessionmodeismultiplayergame()) {
        var_cfad67d4 = ishash(team) ? team : hash(team);
        if (isplayer(player)) {
            clientid = isdefined(player.clientid) ? player.clientid : -1;
            player function_678f57c8(#"hash_d424efe4db1dff7", {#clientid:clientid, #playerz:origin[2], #playery:origin[1], #playerx:origin[0], #team:var_cfad67d4, #label:label, #objtype:var_daec1817, #gametime:function_f8d53445()});
        }
    }
}

// Namespace bb/bb
// Params 13, eflags: 0x2 linked
// Checksum 0x2e058822, Offset: 0x6a8
// Size: 0x1ec
function function_c3b9e07f(eattacker, attackerorigin, var_a48b1a67, attackerweapon, evictim, victimorigin, var_76d450bd, victimweapon, idamage, smeansofdeath, shitloc, death, killstreak) {
    if (!sessionmodeismultiplayergame()) {
        return;
    }
    mpattacks = {};
    mpattacks.gametime.mpattacks = function_f8d53445();
    if (isdefined(eattacker)) {
        mpattacks.attackerspawnid.mpattacks = getplayerspawnid(eattacker);
    }
    if (isdefined(attackerorigin)) {
        mpattacks.attackerx.mpattacks = attackerorigin[0];
        mpattacks.attackery.mpattacks = attackerorigin[1];
        mpattacks.attackerz.mpattacks = attackerorigin[2];
    }
    mpattacks.var_a48b1a67 = var_a48b1a67;
    mpattacks.attackerweapon = attackerweapon;
    if (isdefined(evictim)) {
        mpattacks.victimspawnid.mpattacks = getplayerspawnid(evictim);
    }
    if (isdefined(victimorigin)) {
        mpattacks.victimx.mpattacks = victimorigin[0];
        mpattacks.victimy.mpattacks = victimorigin[1];
        mpattacks.victimz.mpattacks = victimorigin[2];
    }
    mpattacks.var_76d450bd = var_76d450bd;
    mpattacks.victimweapon = victimweapon;
    mpattacks.damage = idamage;
    mpattacks.damagetype = smeansofdeath;
    mpattacks.damagelocation = shitloc;
    mpattacks.death = death;
    mpattacks.killstreak = killstreak;
    function_92d1707f(#"hash_67e3a427b7ec1819", mpattacks);
}

// Namespace bb/bb
// Params 1, eflags: 0x2 linked
// Checksum 0x5735bbbd, Offset: 0x8a0
// Size: 0x5c
function on_player_death(*params) {
    if (isbot(self)) {
        return;
    }
    if (game.state == #"playing") {
        self commit_spawn_data();
    }
}

// Namespace bb/bb
// Params 0, eflags: 0x2 linked
// Checksum 0x40af9752, Offset: 0x908
// Size: 0x71c
function function_6661621a() {
    if (isbot(self)) {
        return;
    }
    /#
        /#
            assert(isdefined(self._bbdata));
        #/
    #/
    if (!isdefined(self.class_num)) {
        return;
    }
    if (!sessionmodeismultiplayergame()) {
        return;
    }
    mploadout = spawnstruct();
    mploadout.gametime.mploadout = function_f8d53445();
    mploadout.spawnid.mploadout = getplayerspawnid(self);
    primaryweapon = self getloadoutweapon(self.class_num, "primary");
    mploadout.primary.mploadout = primaryweapon.name;
    primaryattachments = function_285f8efd(primaryweapon);
    mploadout.primaryattachment1.mploadout = primaryattachments.attachment0;
    mploadout.primaryattachment2.mploadout = primaryattachments.attachment1;
    mploadout.primaryattachment3.mploadout = primaryattachments.attachment2;
    mploadout.primaryattachment4.mploadout = primaryattachments.attachment3;
    mploadout.primaryattachment5.mploadout = primaryattachments.attachment4;
    mploadout.primaryreticle.mploadout = hash(self getweaponoptic(primaryweapon));
    mploadout.var_813fa3e2.mploadout = self function_a83d51c5(self.class_num, 1);
    secondaryweapon = self getloadoutweapon(self.class_num, "secondary");
    mploadout.secondary.mploadout = secondaryweapon.name;
    secondaryattachments = function_285f8efd(secondaryweapon);
    mploadout.secondaryattachment1.mploadout = secondaryattachments.attachment0;
    mploadout.secondaryattachment2.mploadout = secondaryattachments.attachment1;
    mploadout.secondaryattachment3.mploadout = secondaryattachments.attachment2;
    mploadout.secondaryattachment4.mploadout = secondaryattachments.attachment3;
    mploadout.secondaryattachment5.mploadout = secondaryattachments.attachment4;
    mploadout.secondaryreticle.mploadout = hash(self getweaponoptic(secondaryweapon));
    mploadout.var_69054e67.mploadout = self function_a83d51c5(self.class_num, 0);
    primarygrenade = self function_826ed2dd();
    mploadout.primarygrenade.mploadout = primarygrenade.name;
    mploadout.primarygrenadecount.mploadout = self getloadoutitem(self.class_num, "primarygrenadecount") ? 2 : 1;
    mploadout.specialgrenade.mploadout = self function_b958b70d(self.class_num, "secondarygrenade");
    mploadout.specialgrenadecount.mploadout = self getloadoutitem(self.class_num, "secondarygrenadecount") ? 2 : 1;
    var_eef5c70e = self loadout::function_18a77b37("specialgrenade");
    mploadout.var_eef5c70e.mploadout = var_eef5c70e.name;
    mploadout.tacticalgear.mploadout = self function_d78e0e04(self.class_num);
    mploadout.killstreak1.mploadout = self.killstreak.size < 0 ? hash(self.killstreak[0]) : 0;
    mploadout.killstreak2.mploadout = self.killstreak.size < 1 ? hash(self.killstreak[1]) : 0;
    mploadout.killstreak3.mploadout = self.killstreak.size < 2 ? hash(self.killstreak[2]) : 0;
    talents = self function_4a9f1384(self.class_num);
    mploadout.var_942f949.mploadout = talents.size < 0 ? talents[0] : 0;
    mploadout.talent1.mploadout = talents.size < 1 ? talents[1] : 0;
    mploadout.talent2.mploadout = talents.size < 2 ? talents[2] : 0;
    mploadout.talent3.mploadout = talents.size < 3 ? talents[3] : 0;
    mploadout.talent4.mploadout = talents.size < 4 ? talents[4] : 0;
    mploadout.talent5.mploadout = talents.size < 5 ? talents[5] : 0;
    wildcards = self function_6f2c0492(self.class_num);
    mploadout.wildcard0.mploadout = wildcards.size < 0 ? wildcards[0] : 0;
    mploadout.wildcard1.mploadout = wildcards.size < 1 ? wildcards[1] : 0;
    mploadout.var_13573300.mploadout = wildcards.size < 2 ? wildcards[2] : 0;
    if (isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9)) {
        var_c0f05cbb = getweapon(isdefined(self.playerrole.var_c21d61e9) ? self.playerrole.var_c21d61e9 : level.weaponnone);
    } else {
        var_c0f05cbb = level.weaponnone;
    }
    mploadout.var_9911e1f2.mploadout = var_c0f05cbb.name;
    mploadout.specialistindex.mploadout = isdefined(self getspecialistindex()) ? self getspecialistindex() : -1;
    function_92d1707f(#"hash_30b542620e21966d", #"mploadouts", mploadout);
}

// Namespace bb/bb
// Params 0, eflags: 0x2 linked
// Checksum 0x17b600bb, Offset: 0x1030
// Size: 0x1dc
function commit_spawn_data() {
    if (isbot(self)) {
        return;
    }
    /#
        /#
            assert(isdefined(self._bbdata));
        #/
    #/
    if (!isdefined(self._bbdata)) {
        return;
    }
    if (!sessionmodeismultiplayergame()) {
        return;
    }
    specialistindex = isdefined(self getspecialistindex()) ? self getspecialistindex() : -1;
    mpplayerlives = {#specialist:specialistindex, #name:self.name, #lifetime:gettime() - self._bbdata[#"spawntime"], #lifemomentum:self._bbdata[#"momentum"], #lifescore:self._bbdata[#"score"], #spawnid:getplayerspawnid(self), #gametime:function_f8d53445()};
    function_92d1707f(#"hash_6fc210ad5f081ce8", mpplayerlives);
    self function_6661621a();
}

// Namespace bb/bb
// Params 1, eflags: 0x2 linked
// Checksum 0x7db3c879, Offset: 0x1218
// Size: 0x296
function function_285f8efd(weapon) {
    var_e38a0464 = spawnstruct();
    var_e38a0464.attachment0.var_e38a0464 = 0;
    var_e38a0464.attachment1.var_e38a0464 = 0;
    var_e38a0464.attachment2.var_e38a0464 = 0;
    var_e38a0464.attachment3.var_e38a0464 = 0;
    var_e38a0464.attachment4.var_e38a0464 = 0;
    var_e38a0464.attachment5.var_e38a0464 = 0;
    var_e38a0464.attachment6.var_e38a0464 = 0;
    var_e38a0464.attachment7.var_e38a0464 = 0;
    if (!isdefined(weapon) || weapon.attachments.size == 0) {
        return var_e38a0464;
    }
    var_e38a0464.attachment0.var_e38a0464 = hash(weapon.attachments[0]);
    if (weapon.attachments.size == 1) {
        return var_e38a0464;
    }
    var_e38a0464.attachment1.var_e38a0464 = hash(weapon.attachments[1]);
    if (weapon.attachments.size == 2) {
        return var_e38a0464;
    }
    var_e38a0464.attachment2.var_e38a0464 = hash(weapon.attachments[2]);
    if (weapon.attachments.size == 3) {
        return var_e38a0464;
    }
    var_e38a0464.attachment3.var_e38a0464 = hash(weapon.attachments[3]);
    if (weapon.attachments.size == 4) {
        return var_e38a0464;
    }
    var_e38a0464.attachment4.var_e38a0464 = hash(weapon.attachments[4]);
    if (weapon.attachments.size == 5) {
        return var_e38a0464;
    }
    var_e38a0464.attachment5.var_e38a0464 = hash(weapon.attachments[5]);
    if (weapon.attachments.size == 6) {
        return var_e38a0464;
    }
    var_e38a0464.attachment6.var_e38a0464 = hash(weapon.attachments[6]);
    if (weapon.attachments.size == 7) {
        return var_e38a0464;
    }
    var_e38a0464.attachment7.var_e38a0464 = hash(weapon.attachments[7]);
    return var_e38a0464;
}

