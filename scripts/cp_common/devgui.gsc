#using script_32399001bdb550da;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\dev_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\rank_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\weapons_shared;
#using scripts\cp_common\challenges;
#using scripts\cp_common\collectibles;
#using scripts\cp_common\skipto;
#using scripts\cp_common\ui;

#namespace devgui;

/#

    // Namespace devgui/devgui
    // Params 0, eflags: 0x5
    // Checksum 0xc91788e8, Offset: 0x100
    // Size: 0x3c
    function private autoexec __init__system__() {
        system::register(#"devgui", &preinit, undefined, undefined, undefined);
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x4
    // Checksum 0xc695e607, Offset: 0x148
    // Size: 0x25c
    function private preinit() {
        setdvar(#"coop_devgui", "<dev string:x38>");
        setdvar(#"hash_3fbd408cc23e2ec5", "<dev string:x38>");
        setdvar(#"hash_557029b1aad50b1", "<dev string:x38>");
        setdvar(#"debug_center_screen", 0);
        setdvar(#"hash_cc97c3c3764310d", "<dev string:x38>");
        setdvar(#"hash_2a12498fc0843fb5", 0);
        setdvar(#"hash_749e46b2c11ec7c7", 0);
        setdvar(#"hash_6e5349ce99d7adc3", "<dev string:x38>");
        thread devgui_think();
        thread devgui_weapon_think();
        thread devgui_weapon_asset_name_display_think();
        thread dev::devgui_test_chart_think();
        thread init_debug_center_screen();
        level thread function_5a9c86f0();
        level thread dev::body_customization_devgui(2);
        level thread function_57edec18();
        callback::on_start_gametype(&function_df48a6b6);
        callback::on_connect(&devgui_player_connect);
        callback::on_disconnect(&devgui_player_disconnect);
        level.devgui_player_connect = &devgui_player_connect;
        level.devgui_player_disconnect = &devgui_player_disconnect;
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6f55e2d, Offset: 0x3b0
    // Size: 0x1e4
    function function_df48a6b6() {
        level flag::wait_till("<dev string:x3c>");
        rootclear = "<dev string:x53>";
        adddebugcommand(rootclear);
        players = getplayers();
        foreach (player in getplayers()) {
            rootclear = "<dev string:x73>" + player.playername + "<dev string:x8d>";
            adddebugcommand(rootclear);
        }
        thread devgui_player_weapons();
        util::waittill_can_add_debug_command();
        level.player_devgui_base = "<dev string:x94>";
        devgui_add_player_commands(level.player_devgui_base, "<dev string:xab>", 0);
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            ip1 = i + 1;
            players[i] devgui_add_player_commands(level.player_devgui_base, players[i].playername, ip1);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x4cdf009d, Offset: 0x5a0
    // Size: 0x9c
    function devgui_player_connect() {
        if (!isdefined(level.player_devgui_base)) {
            return;
        }
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i] != self) {
                continue;
            }
            self devgui_add_player_commands(level.player_devgui_base, players[i].playername, i + 1);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xf7762b42, Offset: 0x648
    // Size: 0x54
    function devgui_player_disconnect() {
        if (!isdefined(level.player_devgui_base)) {
            return;
        }
        rootclear = "<dev string:x73>" + self.playername + "<dev string:x8d>";
        util::add_queued_debug_command(rootclear);
    }

    // Namespace devgui/devgui
    // Params 3, eflags: 0x0
    // Checksum 0x2f5bb77e, Offset: 0x6a8
    // Size: 0x4e0
    function devgui_add_player_commands(root, pname, pid) {
        player_devgui_root = root + pname + "<dev string:xb4>";
        cmdindex = 1;
        function_5d9b4158(player_devgui_root, pid, "<dev string:xb9>", cmdindex, "<dev string:xc9>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:xd5>", cmdindex, "<dev string:xe3>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:xf0>", cmdindex, "<dev string:x101>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x10b>", cmdindex, "<dev string:x120>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x12a>", cmdindex, "<dev string:x142>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x14a>", cmdindex, "<dev string:x15b>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x16b>", cmdindex, "<dev string:x17e>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x190>", cmdindex, "<dev string:x198>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x1a0>", cmdindex, "<dev string:x1aa>");
        cmdindex++;
        if (isbot(self)) {
            return;
        }
        function_5d9b4158(player_devgui_root, pid, "<dev string:x1b4>", cmdindex, "<dev string:x1cd>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x1dd>", cmdindex, "<dev string:x1ef>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x1ff>", cmdindex, "<dev string:x212>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x223>", cmdindex, "<dev string:x23b>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x24d>", cmdindex, "<dev string:x266>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x279>", cmdindex, "<dev string:x292>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x2a9>", cmdindex, "<dev string:x2c4>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x2dd>", cmdindex, "<dev string:x2f3>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x304>", cmdindex, "<dev string:x310>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x31b>", cmdindex, "<dev string:x338>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x350>", cmdindex, "<dev string:x372>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x385>", cmdindex, "<dev string:x3a2>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x3b5>", cmdindex, "<dev string:x3c7>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x3d7>", cmdindex, "<dev string:x3fa>");
        cmdindex++;
        function_5d9b4158(player_devgui_root, pid, "<dev string:x417>", cmdindex, "<dev string:x435>");
        cmdindex++;
    }

    // Namespace devgui/devgui
    // Params 5, eflags: 0x0
    // Checksum 0x389ac98e, Offset: 0xb90
    // Size: 0x94
    function function_5d9b4158(root, pid, cmdname, *cmdindex, cmddvar) {
        util::add_queued_debug_command(pid + cmdindex + "<dev string:x449>" + "<dev string:x454>" + "<dev string:x46a>" + cmdname + "<dev string:x46f>" + "<dev string:x478>" + "<dev string:x46a>" + cmddvar + "<dev string:x8d>");
    }

    // Namespace devgui/devgui
    // Params 3, eflags: 0x0
    // Checksum 0x604549aa, Offset: 0xc30
    // Size: 0x104
    function devgui_handle_player_command(*cmd, playercallback, pcb_param) {
        pid = getdvarint(#"hash_3fbd408cc23e2ec5", 0);
        if (pid > 0) {
            player = getplayers()[pid - 1];
            if (isdefined(player)) {
                if (isdefined(pcb_param)) {
                    player thread [[ playercallback ]](pcb_param);
                } else {
                    player thread [[ playercallback ]]();
                }
            }
        } else {
            array::thread_all(getplayers(), playercallback, pcb_param);
        }
        setdvar(#"hash_3fbd408cc23e2ec5", "<dev string:x487>");
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x93fdf259, Offset: 0xd40
    // Size: 0x6d0
    function devgui_think() {
        for (;;) {
            cmd = getdvarstring(#"coop_devgui");
            if (cmd == "<dev string:x38>") {
                waitframe(1);
                continue;
            }
            switch (cmd) {
            case #"health":
                devgui_handle_player_command(cmd, &function_9cd052c5);
                break;
            case #"ammo":
                devgui_handle_player_command(cmd, &devgui_toggle_ammo);
                break;
            case #"ignore":
                devgui_handle_player_command(cmd, &function_651c7865);
                break;
            case #"invul_on":
                devgui_handle_player_command(cmd, &devgui_invulnerable, 1);
                break;
            case #"invul_off":
                devgui_handle_player_command(cmd, &devgui_invulnerable, 0);
                break;
            case #"setteam_axis":
                devgui_handle_player_command(cmd, &function_c60fba82, #"axis");
                break;
            case #"setteam_allies":
                devgui_handle_player_command(cmd, &function_c60fba82, #"allies");
                break;
            case #"kill":
                devgui_handle_player_command(cmd, &devgui_kill);
                break;
            case #"revive":
                devgui_handle_player_command(cmd, &function_541ccb87);
                break;
            case #"hash_52845e239e497665":
                devgui_handle_player_command(cmd, &function_fa6a74c3, 100);
                break;
            case #"hash_43a9fbb800953127":
                devgui_handle_player_command(cmd, &function_fa6a74c3, 1000);
                break;
            case #"hash_8219fc726384517":
                devgui_handle_player_command(cmd, &function_c11f6cfe, 100);
                break;
            case #"hash_4afdee64ba81c711":
                devgui_handle_player_command(cmd, &function_c11f6cfe, 1000);
                break;
            case #"hash_42b246496512ccba":
                devgui_handle_player_command(cmd, &collectibles::function_a66b8474);
                break;
            case #"hash_777573ed749058d3":
                devgui_handle_player_command(cmd, &collectibles::function_4e4a7021);
                break;
            case #"hash_62c2f3a35c11cebf":
                devgui_handle_player_command(cmd, &function_8c36f50);
                break;
            case #"hash_3e24fbcff4d4b1eb":
                devgui_handle_player_command(cmd, &function_895ead7c);
                break;
            case #"hash_7d67399c1e80c90f":
                devgui_handle_player_command(cmd, &function_38ea35b);
                break;
            case #"hash_67a420615cfa783d":
                devgui_handle_player_command(cmd, &function_d1f1f7b0);
                break;
            case #"hash_22e23b36dec9f72e":
                devgui_handle_player_command(cmd, &function_b729c951);
                break;
            case #"hash_27b8b67661308678":
                devgui_handle_player_command(cmd, &function_fa6a74c3, 1000000);
                break;
            case #"hash_17ae6e19e0c5fdd2":
                devgui_handle_player_command(cmd, &function_f96938ce);
                break;
            case #"hash_171c599dfd8645fb":
                devgui_handle_player_command(cmd, &function_de31914a, "<dev string:x435>");
                break;
            case 0:
                break;
            default:
                if (isdefined(level.custom_devgui)) {
                    if (isarray(level.custom_devgui)) {
                        foreach (devgui in level.custom_devgui) {
                            if (is_true([[ devgui ]](cmd))) {
                                break;
                            }
                        }
                    } else {
                        [[ level.custom_devgui ]](cmd);
                    }
                }
                break;
            }
            setdvar(#"coop_devgui", "<dev string:x38>");
            wait 0.5;
        }
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0x9a4221b3, Offset: 0x1418
    // Size: 0x2c
    function function_de31914a(stat_name) {
        self challenges::function_8332bc5e(stat_name, 50);
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9876e365, Offset: 0x1450
    // Size: 0xe0
    function function_f96938ce() {
        var_16e5e46 = skipto::function_228558fd();
        foreach (msn in var_16e5e46) {
            self stats::function_dad108fa(#"hash_6c042cdc991e48c2" + getsubstr(getmissionname(msn), 0, 3), 1);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xfff92686, Offset: 0x1538
    // Size: 0x84
    function function_b729c951() {
        for (itemindex = 1; itemindex < 76; itemindex++) {
            self stats::set_stat(#"itemstats", itemindex, #"stats", #"kills", #"statvalue", 999);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe71ea568, Offset: 0x15c8
    // Size: 0x64
    function function_d1f1f7b0() {
        for (itemindex = 1; itemindex < 76; itemindex++) {
            self stats::set_stat(#"itemstats", itemindex, #"xp", 1000000);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x41e9399a, Offset: 0x1638
    // Size: 0xd0
    function function_38ea35b() {
        if (!isdefined(getrootmapname())) {
            return;
        }
        foreach (msn in skipto::function_228558fd()) {
            self stats::set_stat(#"playerstatsbymap", msn, #"hash_1e0160af4fd80dff", 4, 1);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd6d703c1, Offset: 0x1710
    // Size: 0x11c
    function function_895ead7c() {
        if (is_true(self.var_f031ddbc)) {
            self closeluimenu(self.var_f031ddbc);
        }
        self.var_f031ddbc = self openluimenu("<dev string:x48d>");
        waitresult = self waittill(#"menuresponse");
        menu = waitresult.menu;
        for (response = waitresult.response; response != "<dev string:x4a1>"; response = waitresult.response) {
            waitresult = self waittill(#"menuresponse");
            menu = waitresult.menu;
        }
        self closeluimenu(self.var_f031ddbc);
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc8a0b5a0, Offset: 0x1838
    // Size: 0xc8
    function function_8c36f50() {
        var_16e5e46 = skipto::function_228558fd();
        foreach (mission_name in var_16e5e46) {
            self stats::set_stat(#"playerstatsbymap", mission_name, #"hasbeencompleted", 1);
        }
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0xd7df0e5a, Offset: 0x1908
    // Size: 0x74
    function function_fa6a74c3(var_32db513) {
        assert(isdefined(self));
        assert(isplayer(self));
        self addrankxpvalue("<dev string:x4ab>", var_32db513, 0);
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0x70c6db84, Offset: 0x1988
    // Size: 0x104
    function function_c11f6cfe(var_32db513) {
        assert(isdefined(self));
        assert(isplayer(self));
        weapon_ref = self.currentweapon.rootweapon.name;
        weapon_index = getitemindexfromref(weapon_ref);
        var_2888ab1b = self stats::get_stat(#"itemstats", weapon_index, #"xp");
        self stats::set_stat(#"itemstats", weapon_index, #"xp", var_32db513 + var_2888ab1b);
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0x67b6bb84, Offset: 0x1a98
    // Size: 0x74
    function devgui_invulnerable(onoff) {
        if (onoff) {
            self val::set(#"devgui", "<dev string:x4b7>", 0);
            return;
        }
        self val::reset(#"devgui", "<dev string:x4b7>");
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0x1e493f3e, Offset: 0x1b18
    // Size: 0x8c
    function function_c60fba82(teamname) {
        assert(isdefined(self));
        assert(isplayer(self));
        self.team = teamname;
        self.sessionteam = teamname;
        self.pers[#"team"] = teamname;
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x778e5153, Offset: 0x1bb0
    // Size: 0x114
    function devgui_kill() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (isalive(self)) {
            self val::set(#"devgui_kill", "<dev string:x4b7>", 1);
            death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
            self dodamage(self.health + 666, self.origin + death_from);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xcc9edc1d, Offset: 0x1cd0
    // Size: 0x15e
    function devgui_toggle_ammo() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self notify(#"devgui_toggle_ammo");
        self endon(#"devgui_toggle_ammo");
        self.ammo4evah = !is_true(self.ammo4evah);
        while (isdefined(self) && self.ammo4evah) {
            weapon = self getcurrentweapon();
            if (weapon != level.weaponnone) {
                self setweaponoverheating(0, 0);
                max = weapon.maxammo;
                if (isdefined(max)) {
                    self setweaponammostock(weapon, max);
                }
            }
            wait 1;
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe44e460, Offset: 0x1e38
    // Size: 0x9c
    function function_651c7865() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self val::set(#"hash_257f3b3118db7db7", "<dev string:x4c5>", !self.ignoreme);
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x5418d7c3, Offset: 0x1ee0
    // Size: 0x116
    function function_541ccb87() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self reviveplayer();
        if (isdefined(self.revivetrigger)) {
            self.revivetrigger delete();
            self.revivetrigger = undefined;
        }
        self allowjump(1);
        self.laststand = undefined;
        self callback::callback(#"on_player_revived");
        self notify(#"player_revived", {#reviver:self});
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0xcf62e392, Offset: 0x2000
    // Size: 0x72
    function function_4a38f3a4(maxhealth) {
        self endon(#"disconnect", #"hash_147b5d37057b5a78");
        while (true) {
            wait 1;
            if (self.maxhealth != maxhealth) {
                self.maxhealth = maxhealth;
                self.health = self.maxhealth;
            }
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x598c5785, Offset: 0x2080
    // Size: 0xfa
    function function_9cd052c5() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self notify(#"hash_147b5d37057b5a78");
        if (self.maxhealth >= 2000 && isdefined(self.var_77257e19)) {
            self.maxhealth = self.var_77257e19;
        } else {
            self.var_77257e19 = self.maxhealth;
            self.maxhealth = 2000;
            self thread function_4a38f3a4(self.maxhealth);
        }
        self.health = self.maxhealth;
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x2d80aa3f, Offset: 0x2188
    // Size: 0x4e4
    function devgui_player_weapons() {
        level endon(#"game_ended");
        if (is_true(game.devgui_weapons_added)) {
            return;
        }
        level flag::wait_till("<dev string:x3c>");
        wait 0.1;
        a_weapons = enumerateweapons("<dev string:x4d1>");
        var_8a678090 = [];
        var_d766eebd = [];
        var_b972bcd9 = [];
        for (i = 0; i < a_weapons.size; i++) {
            if (weapons::is_primary_weapon(a_weapons[i]) || weapons::is_side_arm(a_weapons[i])) {
                arrayinsert(var_8a678090, a_weapons[i], 0);
                continue;
            }
            if (weapons::is_grenade(a_weapons[i])) {
                arrayinsert(var_d766eebd, a_weapons[i], 0);
                continue;
            }
            arrayinsert(var_b972bcd9, a_weapons[i], 0);
        }
        var_92724e9c = "<dev string:x94>";
        adddebugcommand(var_92724e9c + "<dev string:xab>" + "<dev string:x4db>" + "<dev string:x505>" + "<dev string:x530>");
        adddebugcommand(var_92724e9c + "<dev string:xab>" + "<dev string:x53b>" + "<dev string:x56c>" + "<dev string:x530>");
        adddebugcommand(var_92724e9c + "<dev string:xab>" + "<dev string:x583>" + "<dev string:x5ba>" + "<dev string:x530>");
        level thread devgui_add_player_weapons(var_92724e9c, "<dev string:xab>", 0, var_d766eebd, "<dev string:x5df>");
        level thread devgui_add_player_weapons(var_92724e9c, "<dev string:xab>", 0, var_8a678090, "<dev string:x5eb>");
        level thread devgui_add_player_weapons(var_92724e9c, "<dev string:xab>", 0, var_b972bcd9, "<dev string:x5f3>");
        function_131c6ccd(var_92724e9c, "<dev string:xab>", 0, var_8a678090, "<dev string:x5fb>");
        players = getplayers();
        size = players.size;
        if (size > 2) {
            size = 2;
        }
        for (i = 0; i < size; i++) {
            ip1 = i + 1;
            adddebugcommand(var_92724e9c + players[i].playername + "<dev string:x4db>" + "<dev string:x505>" + "<dev string:x530>");
            adddebugcommand(var_92724e9c + players[i].playername + "<dev string:x53b>" + "<dev string:x56c>" + "<dev string:x530>");
            adddebugcommand(var_92724e9c + players[i].playername + "<dev string:x583>" + "<dev string:x5ba>" + "<dev string:x530>");
            level thread devgui_add_player_weapons(var_92724e9c, players[i].playername, ip1, var_d766eebd, "<dev string:x5df>");
            level thread devgui_add_player_weapons(var_92724e9c, players[i].playername, ip1, var_8a678090, "<dev string:x5eb>");
            level thread devgui_add_player_weapons(var_92724e9c, players[i].playername, ip1, var_b972bcd9, "<dev string:x5f3>");
            level thread function_131c6ccd(var_92724e9c, players[i].playername, ip1, var_8a678090, "<dev string:x5fb>");
        }
        game.devgui_weapons_added = 1;
    }

    // Namespace devgui/devgui
    // Params 5, eflags: 0x0
    // Checksum 0xfac173a5, Offset: 0x2678
    // Size: 0x218
    function function_131c6ccd(root, pname, index, a_weapons, weapon_type) {
        level endon(#"game_ended");
        player_devgui_root = root + pname + "<dev string:xb4>" + "<dev string:x60a>" + weapon_type + "<dev string:xb4>";
        attachments = [];
        foreach (weapon in a_weapons) {
            foreach (var_ffefdfd6 in weapon.supportedattachments) {
                array::add(attachments, var_ffefdfd6, 0);
            }
        }
        pid = "<dev string:x38>" + index;
        foreach (att in attachments) {
            function_8f3e84bc(player_devgui_root, pid, att, 1);
        }
    }

    // Namespace devgui/devgui
    // Params 5, eflags: 0x0
    // Checksum 0x1e102ab9, Offset: 0x2898
    // Size: 0x21c
    function devgui_add_player_weapons(root, pname, index, a_weapons, weapon_type) {
        level endon(#"game_ended");
        player_devgui_root = root + pname + "<dev string:xb4>" + "<dev string:x60a>" + weapon_type + "<dev string:xb4>";
        pid = "<dev string:x38>" + index;
        if (isdefined(a_weapons)) {
            for (i = 0; i < a_weapons.size; i++) {
                if (weapon_type == "<dev string:x5eb>") {
                    attachments = [];
                } else {
                    attachments = a_weapons[i].supportedattachments;
                }
                name = getweaponname(a_weapons[i]);
                if (attachments.size) {
                    devgui_add_player_weap_command(player_devgui_root + name + "<dev string:xb4>", pid, name, i + 1);
                    foreach (att in attachments) {
                        if (att != "<dev string:x616>") {
                            devgui_add_player_weap_command(player_devgui_root + name + "<dev string:xb4>", pid, name + "<dev string:x61e>" + att, i + 1);
                        }
                    }
                    continue;
                }
                devgui_add_player_weap_command(player_devgui_root, pid, name, i + 1);
            }
        }
    }

    // Namespace devgui/devgui
    // Params 4, eflags: 0x0
    // Checksum 0x6e176054, Offset: 0x2ac0
    // Size: 0xa4
    function devgui_add_player_weap_command(root, pid, weap_name, *cmdindex) {
        util::waittill_can_add_debug_command();
        adddebugcommand(pid + cmdindex + "<dev string:x449>" + "<dev string:x623>" + "<dev string:x46a>" + weap_name + "<dev string:x46f>" + "<dev string:x63c>" + "<dev string:x46a>" + cmdindex + "<dev string:x8d>");
    }

    // Namespace devgui/devgui
    // Params 4, eflags: 0x0
    // Checksum 0xbb7e06c5, Offset: 0x2b70
    // Size: 0xa4
    function function_8f3e84bc(root, pid, attachment_name, *cmdindex) {
        util::waittill_can_add_debug_command();
        adddebugcommand(pid + cmdindex + "<dev string:x449>" + "<dev string:x623>" + "<dev string:x46a>" + attachment_name + "<dev string:x46f>" + "<dev string:x64e>" + "<dev string:x46a>" + cmdindex + "<dev string:x8d>");
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x730ddbfe, Offset: 0x2c20
    // Size: 0x128
    function devgui_weapon_think() {
        for (;;) {
            weapon_name = getdvarstring(#"hash_557029b1aad50b1");
            if (weapon_name != "<dev string:x38>") {
                devgui_handle_player_command(weapon_name, &devgui_give_weapon, weapon_name);
                setdvar(#"hash_557029b1aad50b1", "<dev string:x38>");
            }
            attachmentname = getdvarstring(#"hash_cc97c3c3764310d");
            if (attachmentname != "<dev string:x38>") {
                devgui_handle_player_command(attachmentname, &function_848084d4, attachmentname);
                setdvar(#"hash_cc97c3c3764310d", "<dev string:x38>");
            }
            wait 0.5;
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xae3f3d74, Offset: 0x2d50
    // Size: 0x3c6
    function devgui_weapon_asset_name_display_think() {
        update_time = 0.5;
        print_duration = int(update_time / float(function_60d95f53()) / 1000);
        printlnbold_update = int(1 / update_time);
        printlnbold_counter = 0;
        colors = [];
        colors[colors.size] = (1, 1, 1);
        colors[colors.size] = (1, 0, 0);
        colors[colors.size] = (0, 1, 0);
        colors[colors.size] = (1, 1, 0);
        colors[colors.size] = (1, 0, 1);
        colors[colors.size] = (0, 1, 1);
        for (;;) {
            wait update_time;
            display = getdvarint(#"hash_749e46b2c11ec7c7", 0);
            if (!display) {
                continue;
            }
            if (!printlnbold_counter) {
                iprintlnbold(getweaponname(level.players[0] getcurrentweapon()));
            }
            printlnbold_counter++;
            if (printlnbold_counter >= printlnbold_update) {
                printlnbold_counter = 0;
            }
            color_index = 0;
            for (i = 1; i < level.players.size; i++) {
                player = level.players[i];
                weapon = player getcurrentweapon();
                if (!isdefined(weapon) || level.weaponnone == weapon) {
                    continue;
                }
                print3d(player gettagorigin("<dev string:x666>"), getweaponname(weapon), colors[color_index], 1, 0.15, print_duration);
                color_index++;
                if (color_index >= colors.size) {
                    color_index = 0;
                }
            }
            color_index = 0;
            ai_list = getaiarray();
            for (i = 0; i < ai_list.size; i++) {
                ai = ai_list[i];
                if (isvehicle(ai)) {
                    weapon = ai.turretweapon;
                } else {
                    weapon = ai.weapon;
                }
                if (!isdefined(weapon) || level.weaponnone == weapon) {
                    continue;
                }
                print3d(ai gettagorigin("<dev string:x666>"), getweaponname(weapon), colors[color_index], 1, 0.15, print_duration);
                color_index++;
                if (color_index >= colors.size) {
                    color_index = 0;
                }
            }
        }
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0x62ad888d, Offset: 0x3120
    // Size: 0x31c
    function devgui_give_weapon(weapon_name) {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self notify(#"devgui_give_ammo");
        self endon(#"devgui_give_ammo");
        currentweapon = self getcurrentweapon();
        split = strtok(weapon_name, "<dev string:x61e>");
        switch (split.size) {
        case 1:
        default:
            weapon = getweapon(split[0]);
            break;
        case 2:
            weapon = getweapon(split[0], split[1]);
            break;
        case 3:
            weapon = getweapon(split[0], split[1], split[2]);
            break;
        case 4:
            weapon = getweapon(split[0], split[1], split[2], split[3]);
            break;
        case 5:
            weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
            break;
        }
        if (currentweapon != weapon) {
            if (getdvarint(#"hash_2a12498fc0843fb5", 0)) {
                adddebugcommand("<dev string:x673>" + weapon_name);
                waitframe(1);
            } else {
                self takeweapon(currentweapon);
                self giveweapon(weapon);
                self switchtoweapon(weapon);
            }
            max = weapon.maxammo;
            if (max) {
                self setweaponammostock(weapon, max);
            }
        }
    }

    // Namespace devgui/devgui
    // Params 1, eflags: 0x0
    // Checksum 0xd77fbaa8, Offset: 0x3448
    // Size: 0x41c
    function function_848084d4(attachment_name) {
        assert(isdefined(self));
        assert(isplayer(self));
        if (!isalive(self)) {
            return;
        }
        self notify(#"hash_1db87c450e38d18f");
        self endon(#"hash_1db87c450e38d18f");
        currentweapon = self getcurrentweapon();
        var_aa9cebb1 = 0;
        split = strtok(getweaponname(currentweapon), "<dev string:x61e>");
        foreach (attachment in currentweapon.supportedattachments) {
            if (attachment == attachment_name) {
                var_aa9cebb1 = 1;
            }
        }
        if (var_aa9cebb1 == 0) {
            iprintlnbold("<dev string:x67c>" + attachment_name + "<dev string:x68b>" + split[0]);
            attachmentsstring = "<dev string:x6a5>";
            if (currentweapon.supportedattachments.size == 0) {
                attachmentsstring += "<dev string:x6b4>";
            }
            foreach (attachment in currentweapon.supportedattachments) {
                attachmentsstring += "<dev string:x61e>" + attachment;
            }
            iprintlnbold(attachmentsstring);
            return;
        }
        foreach (currentattachment in split) {
            if (currentattachment == attachment_name) {
                iprintlnbold("<dev string:x67c>" + attachment_name + "<dev string:x6bd>" + getweaponname(currentweapon));
                return;
            }
        }
        split[split.size] = attachment_name;
        for (index = split.size; index < 9; index++) {
            split[index] = "<dev string:x616>";
        }
        self takeweapon(currentweapon);
        newweapon = getweapon(split[0], split[1], split[2], split[3], split[4], split[5], split[6], split[7]);
        self giveweapon(newweapon);
        self switchtoweapon(newweapon);
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xda29f7d8, Offset: 0x3870
    // Size: 0x12c
    function init_debug_center_screen() {
        zero_idle_movement = 0;
        for (;;) {
            if (getdvarint(#"debug_center_screen", 0)) {
                if (!isdefined(level.center_screen_debug_hudelem_active) || level.center_screen_debug_hudelem_active == 0) {
                    thread debug_center_screen();
                    zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
                    if (zero_idle_movement == 0) {
                        setdvar(#"zero_idle_movement", 1);
                        zero_idle_movement = 1;
                    }
                }
            } else {
                level notify(#"stop center screen debug");
                if (zero_idle_movement == 1) {
                    setdvar(#"zero_idle_movement", 0);
                    zero_idle_movement = 0;
                }
            }
            waitframe(1);
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc4b6fef9, Offset: 0x39a8
    // Size: 0x238
    function debug_center_screen() {
        level.center_screen_debug_hudelem_active = 1;
        wait 0.1;
        level.center_screen_debug_hudelem1 = newdebughudelem(level.players[0]);
        level.center_screen_debug_hudelem1.alignx = "<dev string:x6d9>";
        level.center_screen_debug_hudelem1.aligny = "<dev string:x6e3>";
        level.center_screen_debug_hudelem1.fontscale = 1;
        level.center_screen_debug_hudelem1.alpha = 0.5;
        level.center_screen_debug_hudelem1.x = 320 - 1;
        level.center_screen_debug_hudelem1.y = 240;
        level.center_screen_debug_hudelem1 setshader("<dev string:x6ed>", 1000, 1);
        level.center_screen_debug_hudelem2 = newdebughudelem(level.players[0]);
        level.center_screen_debug_hudelem2.alignx = "<dev string:x6d9>";
        level.center_screen_debug_hudelem2.aligny = "<dev string:x6e3>";
        level.center_screen_debug_hudelem2.fontscale = 1;
        level.center_screen_debug_hudelem2.alpha = 0.5;
        level.center_screen_debug_hudelem2.x = 320 - 1;
        level.center_screen_debug_hudelem2.y = 240;
        level.center_screen_debug_hudelem2 setshader("<dev string:x6ed>", 1, 480);
        level waittill(#"stop center screen debug");
        level.center_screen_debug_hudelem1 destroy();
        level.center_screen_debug_hudelem2 destroy();
        level.center_screen_debug_hudelem_active = 0;
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x206f41bb, Offset: 0x3be8
    // Size: 0xa4
    function function_5a9c86f0() {
        setdvar(#"hash_646be3524c8b225b", 0);
        adddebugcommand("<dev string:x6f6>");
        adddebugcommand("<dev string:x74c>");
        adddebugcommand("<dev string:x7a5>");
        adddebugcommand("<dev string:x805>");
        level thread function_505cd4da();
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x0
    // Checksum 0x8039556f, Offset: 0x3c98
    // Size: 0x288
    function function_505cd4da() {
        level notify(#"hash_242671403e167291");
        level endon(#"hash_242671403e167291");
        while (true) {
            cmd = getdvarstring(#"hash_646be3524c8b225b");
            var_6019e2d9 = [];
            if (isarray(level.var_ef4974d7)) {
                var_6019e2d9 = getarraykeys(level.var_ef4974d7);
            }
            switch (cmd) {
            case #"hash_12e35667bc66baa9":
                ui::function_f7aafb81("<dev string:x868>");
                break;
            case #"hash_22ed7cc6e9fda6c2":
                ui::function_bb62027a("<dev string:x868>");
                break;
            case #"hash_679b069e13fed10c":
                level.var_738bd204 = 1;
                foreach (var_fd2ef744 in var_6019e2d9) {
                    ui::function_f7aafb81(var_fd2ef744);
                }
                break;
            case #"hash_421b1673272a4585":
                level.var_738bd204 = undefined;
                foreach (var_fd2ef744 in var_6019e2d9) {
                    ui::function_bb62027a(var_fd2ef744);
                }
                break;
            }
            setdvar(#"hash_646be3524c8b225b", 0);
            wait 0.5;
        }
    }

    // Namespace devgui/devgui
    // Params 0, eflags: 0x4
    // Checksum 0xde68ef2b, Offset: 0x3f28
    // Size: 0x1be
    function private function_57edec18() {
        util::add_devgui("<dev string:x87e>", "<dev string:x8a2>");
        util::add_devgui("<dev string:x8bc>", "<dev string:x8e1>");
        while (true) {
            if (getdvarint(#"scr_drone_camera", 0)) {
                if (isdefined(level.drone_camera)) {
                    waitframe(1);
                    continue;
                }
                player = getplayers()[0];
                if (!isdefined(player)) {
                    waitframe(1);
                    continue;
                }
                drone_camera = spawnvehicle("<dev string:x8fb>", player.origin + (0, 0, 150), player.angles, "<dev string:x912>");
                drone_camera.ignoreme = 1;
                drone_camera usevehicle(player, 0);
                level.drone_camera = drone_camera;
            } else if (isdefined(level.drone_camera)) {
                driver = level.drone_camera getseatoccupant(0);
                if (isdefined(driver)) {
                    driver unlink();
                }
                level.drone_camera delete();
            }
            waitframe(1);
        }
    }

#/
