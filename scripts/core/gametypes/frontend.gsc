#using scripts\core_common\animation_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\gamestate;
#using scripts\core_common\popups_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;

#namespace frontend;

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xd0
// Size: 0x4
function callback_void()
{
    
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x6300f260, Offset: 0xe0
// Size: 0x24
function callback_actorspawnedfrontend( spawner )
{
    self thread spawner::spawn_think( spawner );
}

// Namespace frontend/gametype_init
// Params 1, eflags: 0x20
// Checksum 0x1aba0b17, Offset: 0x110
// Size: 0x214
function event_handler[gametype_init] main( *eventstruct )
{
    level.callbackstartgametype = &callback_void;
    level.callbackplayerconnect = &callback_playerconnect;
    level.callbackplayerdisconnect = &callback_void;
    level.callbackentityspawned = &callback_void;
    level.callbackactorspawned = &callback_actorspawnedfrontend;
    level.orbis = getdvarstring( #"orbisgame" ) == "true";
    level.durango = getdvarstring( #"durangogame" ) == "true";
    level.weaponnone = getweapon( #"none" );
    level.teambased = 0;
    gamestate::set_state( #"pregame" );
    level.var_26be8a4f = 1;
    level.var_850ff7e2 = [ #"zm_silver_upgrade", #"zm_silver_six" ];
    callback::add_callback( #"menu_response", &on_menu_response );
    
    /#
        level function_83f052f2();
        level thread function_5f1dd5aa();
        level function_41cd078d();
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x4
// Checksum 0x54565d6e, Offset: 0x330
// Size: 0x1ac
function private on_menu_response( eventstruct )
{
    if ( eventstruct.response === #"hash_45ef0f91897a4887" )
    {
        if ( isdefined( level.var_850ff7e2 ) && isdefined( level.var_850ff7e2[ eventstruct.intpayload ] ) && ishash( level.var_850ff7e2[ eventstruct.intpayload ] ) )
        {
            self giveachievement( level.var_850ff7e2[ eventstruct.intpayload ] );
        }
        
        return;
    }
    
    if ( eventstruct.response === #"hash_5d0de86d96808d71" )
    {
        if ( eventstruct.intpayload === 1 )
        {
            machine_array = getdynentarray( #"hash_69b47fecbecb8b0", 1 );
            assert( isdefined( machine_array ) && machine_array.size == 1 );
            level.var_d0e9b96 = machine_array[ 0 ];
        }
        else
        {
            level.var_d0e9b96 = undefined;
        }
        
        return;
    }
    
    if ( eventstruct.response === #"arcade_state" )
    {
        if ( isdefined( level.var_d0e9b96 ) )
        {
            setdynentstate( level.var_d0e9b96, eventstruct.intpayload );
        }
    }
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x65b13b63, Offset: 0x4e8
// Size: 0x1c
function callback_playerconnect()
{
    /#
        self thread dailychallengedevguithink();
    #/
}

/#

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xf69dd834, Offset: 0x510
    // Size: 0x144, Type: dev
    function dailychallengedevguiinit()
    {
        setdvar( #"daily_challenge_cmd", 0 );
        num_rows = tablelookuprowcount( #"gamedata/stats/zm/statsmilestones4.csv" );
        
        for (row_num = 2; row_num < num_rows; row_num++) {
            challenge_name = tablelookupcolumnforrow( #"gamedata/stats/zm/statsmilestones4.csv", row_num, 5 );
            display_row_num = row_num - 2;
            devgui_string = "<dev string:x38>" + "<dev string:x48>" + ( display_row_num > 10 ? display_row_num : "<dev string:x60>" + display_row_num ) + "<dev string:x65>" + function_9e72a96( challenge_name ) + "<dev string:x6a>" + row_num + "<dev string:x85>";
            adddebugcommand( devgui_string );
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x601737d8, Offset: 0x660
    // Size: 0x4c, Type: dev
    function function_83f052f2()
    {
        setdvar( #"ct_cmd", "<dev string:x8c>" );
        adddebugcommand( "<dev string:x90>" );
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xb658177b, Offset: 0x6b8
    // Size: 0x100, Type: dev
    function function_5f1dd5aa()
    {
        self endon( #"disconnect" );
        
        while ( true )
        {
            ct_cmd = getdvarstring( #"ct_cmd", "<dev string:x8c>" );
            
            if ( ct_cmd == "<dev string:x8c>" )
            {
                wait 0.25;
                continue;
            }
            
            if ( ct_cmd == "<dev string:xed>" )
            {
                unlocked = getdvar( #"ui_unlock_all_ct", 0 );
                setdvar( #"ui_unlock_all_ct", !unlocked );
            }
            
            setdvar( #"ct_cmd", "<dev string:x8c>" );
        }
    }

    // Namespace frontend/ui_menuresponse
    // Params 1, eflags: 0x20
    // Checksum 0xc8cdcbf, Offset: 0x7c0
    // Size: 0x43c, Type: dev
    function event_handler[ui_menuresponse] codecallback_menuresponse( eventstruct )
    {
        spawningplayer = self;
        menu = eventstruct.menu;
        response = eventstruct.response;
        
        if ( !isdefined( menu ) )
        {
            menu = "<dev string:x8c>";
        }
        
        if ( !isdefined( response ) )
        {
            response = "<dev string:x8c>";
        }
        
        if ( menu == "<dev string:x105>" )
        {
            player = getplayers()[ 0 ];
            
            if ( !isdefined( player ) )
            {
                return;
            }
            
            if ( isalive( player ) )
            {
                player.health = 0;
                player.sessionstate = "<dev string:x115>";
                origin = player.origin;
                
                if ( player isinmovemode( "<dev string:x122>" ) )
                {
                    origin = ( player.origin[ 0 ], player.origin[ 1 ], player.origin[ 2 ] + 60 );
                }
                
                player spawn( origin, player.angles );
                return;
            }
            
            if ( player isinmovemode( "<dev string:x12c>" ) )
            {
                adddebugcommand( "<dev string:x12c>" );
                wait 0.1;
            }
            
            if ( player isinmovemode( "<dev string:x122>" ) )
            {
                adddebugcommand( "<dev string:x122>" );
                wait 0.1;
            }
            
            var_175d3c32 = function_9e72a96( response );
            tokens = strtok( var_175d3c32, "<dev string:x133>" );
            spawn = spawnstruct();
            spawn.origin = ( int( tokens[ 0 ] ), int( tokens[ 1 ] ), int( tokens[ 2 ] ) - 60 );
            spawn.angles = ( int( tokens[ 3 ] ), int( tokens[ 4 ] ), int( tokens[ 5 ] ) );
            player.sessionstate = "<dev string:x138>";
            player.health = 100;
            player.maxhealth = player.health;
            player spawn( spawn.origin, spawn.angles );
            wait 0.1;
            
            if ( player isinmovemode( "<dev string:x12c>" ) )
            {
                adddebugcommand( "<dev string:x12c>" );
                wait 0.1;
            }
            
            if ( !isgodmode( player ) )
            {
                adddebugcommand( "<dev string:x143>" );
                wait 0.1;
            }
            
            if ( !player isinmovemode( "<dev string:x122>" ) )
            {
                adddebugcommand( "<dev string:x122>" );
                wait 0.1;
            }
            
            player setorigin( spawn.origin );
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xdb333bd4, Offset: 0xc08
    // Size: 0x190, Type: dev
    function dailychallengedevguithink()
    {
        self endon( #"disconnect" );
        
        while ( true )
        {
            daily_challenge_cmd = getdvarint( #"daily_challenge_cmd", 0 );
            
            if ( daily_challenge_cmd == 0 || !sessionmodeiszombiesgame() )
            {
                wait 1;
                continue;
            }
            
            daily_challenge_row = daily_challenge_cmd;
            daily_challenge_index = tablelookupcolumnforrow( #"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 0 );
            daily_challenge_stat = tablelookupcolumnforrow( #"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 4 );
            adddebugcommand( "<dev string:x14a>" + daily_challenge_stat + "<dev string:x16b>" + "<dev string:x180>" );
            adddebugcommand( "<dev string:x186>" + daily_challenge_index + "<dev string:x180>" );
            adddebugcommand( "<dev string:x1cc>" + "<dev string:x180>" );
            setdvar( #"daily_challenge_cmd", 0 );
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x476eaf7d, Offset: 0xda0
    // Size: 0x3e0, Type: dev
    function function_27d2e95a()
    {
        level.callingsbundle = getscriptbundle( "<dev string:x215>" );
        
        if ( !isdefined( level.callingsbundle ) )
        {
            return;
        }
        
        setdvar( #"callings_cmd", "<dev string:x8c>" );
        adddebugcommand( "<dev string:x22d>" );
        
        for (seasonid = 1; seasonid <= level.callingsbundle.size; seasonid++) {
            for (factionid = 0; factionid < 4; factionid++) {
                faction = getscriptbundle( level.callingsbundle.factionlist[ factionid ].faction );
                factionname = makelocalizedstring( faction.factionname );
                var_662e72f3 = array( 0, 1, 3, 6, 12 );
                counter = 1;
                
                foreach ( tokens in var_662e72f3 )
                {
                    tokencmd = "<dev string:x282>" + seasonid + "<dev string:x292>" + factionid + "<dev string:x292>" + tokens;
                    devgui_string = "<dev string:x297>" + seasonid + "<dev string:x2cd>" + factionname + "<dev string:x2d3>" + tokens + "<dev string:x2d8>" + ( tokens != 1 ? "<dev string:x2e2>" : "<dev string:x8c>" ) + "<dev string:x2e7>" + counter + "<dev string:x2ec>" + tokencmd + "<dev string:x300>";
                    adddebugcommand( devgui_string );
                    counter++;
                }
                
                counter = 1;
                
                for (completedtier = 0; completedtier <= 12; completedtier++) {
                    var_f6c57b = "<dev string:x306>" + seasonid + "<dev string:x292>" + factionid + "<dev string:x292>" + completedtier;
                    devgui_string = "<dev string:x31d>" + seasonid + "<dev string:x2cd>" + factionname + "<dev string:x35b>" + completedtier + "<dev string:x2e7>" + counter + "<dev string:x2ec>" + var_f6c57b + "<dev string:x300>";
                    adddebugcommand( devgui_string );
                    counter++;
                }
            }
            
            adddebugcommand( "<dev string:x365>" + seasonid + "<dev string:x2e7>" + seasonid + "<dev string:x39e>" + seasonid + "<dev string:x300>" );
            seasonid++;
        }
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x40 variadic
    // Checksum 0x56beb4ce, Offset: 0x1188
    // Size: 0xbc, Type: dev
    function function_1c289498( ... )
    {
        assert( vararg.size > 1 );
        
        if ( vararg.size <= 1 )
        {
            return;
        }
        
        cmd = "<dev string:x3c0>";
        
        for (i = 0; i < vararg.size; i++) {
            cmd += vararg[ i ] + "<dev string:x65>";
        }
        
        cmd += "<dev string:x3d1>";
        adddebugcommand( cmd );
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x0
    // Checksum 0x51921a, Offset: 0x1250
    // Size: 0x20c, Type: dev
    function function_c209f336( seasonid )
    {
        function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x3ef>" );
        function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x405>" );
        function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x41b>" );
        function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x431>" );
        
        for (factionid = 0; factionid < 4; factionid++) {
            function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x444>", factionid, "<dev string:x450>" );
            function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x444>", factionid, "<dev string:x45a>" );
            function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x444>", factionid, "<dev string:x46c>" );
            
            for (groupid = 0; groupid < 3; groupid++) {
                for (categoryid = 0; categoryid < 4; categoryid++) {
                    function_1c289498( "<dev string:x3d7>", seasonid - 1, "<dev string:x444>", factionid, "<dev string:x47a>", groupid, "<dev string:x48d>", categoryid, "<dev string:x4a1>" );
                }
            }
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x3b27b50e, Offset: 0x1468
    // Size: 0x2a4, Type: dev
    function function_87e397ba()
    {
        for (seasonid = 1; seasonid <= level.callingsbundle.size; seasonid++) {
            function_c209f336( seasonid );
        }
        
        function_1c289498( "<dev string:x4ae>", "<dev string:x4bf>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x4ce>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x4dd>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x4f6>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x507>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x517>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x52d>" );
        function_1c289498( "<dev string:x4ae>", "<dev string:x549>" );
        
        for (i = 0; i < 4; i++) {
            function_1c289498( "<dev string:x4ae>", "<dev string:x560>", i, "<dev string:x56c>" );
            function_1c289498( "<dev string:x4ae>", "<dev string:x560>", i, "<dev string:x575>" );
            function_1c289498( "<dev string:x4ae>", "<dev string:x581>", i, "<dev string:x58f>" );
            function_1c289498( "<dev string:x4ae>", "<dev string:x581>", i, "<dev string:x59a>" );
            function_1c289498( "<dev string:x4ae>", "<dev string:x581>", i, "<dev string:x56c>" );
        }
        
        for (factionid = 0; factionid < 4; factionid++) {
            function_1c289498( "<dev string:x4ae>", "<dev string:x5aa>", factionid );
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x719ed67c, Offset: 0x1718
    // Size: 0x478, Type: dev
    function function_2cdf0184()
    {
        if ( !isdefined( level.callingsbundle ) )
        {
            return;
        }
        
        level endon( #"game_ended" );
        
        while ( true )
        {
            callings_cmd = getdvarstring( #"callings_cmd", "<dev string:x8c>" );
            
            if ( callings_cmd == "<dev string:x8c>" )
            {
                wait 0.25;
                continue;
            }
            
            if ( callings_cmd == "<dev string:x5be>" )
            {
                function_87e397ba();
            }
            else if ( strstartswith( callings_cmd, "<dev string:x282>" ) )
            {
                str = strreplace( callings_cmd, "<dev string:x282>", "<dev string:x8c>" );
                arr = strtok( str, "<dev string:x292>" );
                seasonid = arr[ 0 ];
                factionid = arr[ 1 ];
                tokens = arr[ 2 ];
                statpath = "<dev string:x5d1>" + int( seasonid ) - 1 + "<dev string:x5ea>" + factionid + "<dev string:x5f8>" + tokens;
                adddebugcommand( "<dev string:x3c0>" + statpath + "<dev string:x180>" );
            }
            else if ( strstartswith( callings_cmd, "<dev string:x604>" ) )
            {
                str = strreplace( callings_cmd, "<dev string:x604>", "<dev string:x8c>" );
                seasonid = int( str );
                function_c209f336( seasonid );
            }
            else if ( strstartswith( callings_cmd, "<dev string:x306>" ) )
            {
                str = strreplace( callings_cmd, "<dev string:x306>", "<dev string:x8c>" );
                arr = strtok( str, "<dev string:x292>" );
                seasonid = arr[ 0 ];
                factionid = arr[ 1 ];
                tier = arr[ 2 ];
                statpath = "<dev string:x5d1>" + int( seasonid ) - 1 + "<dev string:x5ea>" + factionid + "<dev string:x616>" + tier;
                adddebugcommand( "<dev string:x3c0>" + statpath + "<dev string:x180>" );
            }
            else if ( strstartswith( callings_cmd, "<dev string:x62a>" ) )
            {
                str = strreplace( callings_cmd, "<dev string:x62a>", "<dev string:x8c>" );
                arr = strtok( str, "<dev string:x292>" );
                taskid = arr[ 0 ];
                taskid = int( taskid );
                setdvar( #"zm_active_daily_calling", taskid );
                setdvar( #"zm_active_event_calling", 0 );
                setdvar( #"hash_acdd08b365cb62f", 1 );
            }
            
            setdvar( #"callings_cmd", "<dev string:x8c>" );
        }
    }

    // Namespace frontend/frontend
    // Params 2, eflags: 0x0
    // Checksum 0x4dd6be9, Offset: 0x1b98
    // Size: 0x6c, Type: dev
    function function_1fcf4d0e( menu_path, commands )
    {
        var_c62ccf1 = "<dev string:x645>";
        adddebugcommand( "<dev string:x38>" + var_c62ccf1 + menu_path + "<dev string:x650>" + commands + "<dev string:x300>" );
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x0
    // Checksum 0x712a90e4, Offset: 0x1c10
    // Size: 0x54, Type: dev
    function function_8aa5abd4( menu_path )
    {
        var_c62ccf1 = "<dev string:x645>";
        adddebugcommand( "<dev string:x657>" + var_c62ccf1 + menu_path + "<dev string:x300>" );
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x663adc63, Offset: 0x1c70
    // Size: 0x15c, Type: dev
    function function_41cd078d()
    {
        adddebugcommand( "<dev string:x66a>" );
        adddebugcommand( "<dev string:x690>" );
        adddebugcommand( "<dev string:x6b2>" );
        adddebugcommand( "<dev string:x6d2>" );
        adddebugcommand( "<dev string:x6f7>" );
        adddebugcommand( "<dev string:x734>" );
        adddebugcommand( "<dev string:x76d>" );
        function_1fcf4d0e( "<dev string:x7b2>", "<dev string:x7d2>" + "<dev string:x7da>" + "<dev string:x7f0>" );
        function_1fcf4d0e( "<dev string:x802>", "<dev string:x7d2>" + "<dev string:x7da>" + "<dev string:x813>" );
        function_1fcf4d0e( "<dev string:x829>", "<dev string:x7d2>" + "<dev string:x7da>" + "<dev string:x847>" );
        level thread function_e4ea0153();
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x62b5bd01, Offset: 0x1dd8
    // Size: 0x198, Type: dev
    function function_e4ea0153()
    {
        setdvar( #"hash_3319d0fd07c9ead8", "<dev string:x8c>" );
        
        while ( true )
        {
            aarcmd = getdvarstring( #"hash_3319d0fd07c9ead8", "<dev string:x8c>" );
            
            if ( aarcmd == "<dev string:x8c>" )
            {
                waitframe( 1 );
                continue;
            }
            
            if ( aarcmd == "<dev string:x86a>" )
            {
                luinotifyevent( #"hash_66d52cf08267edc4" );
            }
            else if ( aarcmd == "<dev string:x87b>" )
            {
                luinotifyevent( #"aar_clear_rewards" );
            }
            else if ( aarcmd == "<dev string:x890>" )
            {
                if ( !isdefined( level.var_9c7f7c5d ) )
                {
                    level thread function_daf9ea48();
                    level.var_9c7f7c5d = 1;
                }
            }
            else if ( aarcmd == "<dev string:x8b2>" )
            {
                function_9eac333e();
            }
            
            setdvar( #"hash_3319d0fd07c9ead8", "<dev string:x8c>" );
            wait 0.25;
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x54e3ddb9, Offset: 0x1f78
    // Size: 0x34a, Type: dev
    function function_daf9ea48()
    {
        if ( isdefined( level.var_9c7f7c5d ) && level.var_60e97f7b )
        {
            return;
        }
        
        function_8aa5abd4( "<dev string:x829>" );
        notif_challenges_devgui_base = "<dev string:x8cf>";
        
        for (i = 1; i <= popups::devgui_notif_getchallengestablecount(); i++) {
            tablename = popups::devgui_notif_getchallengestablename( i );
            rows = tablelookuprowcount( tablename );
            
            for (j = 1; j < rows; j++) {
                challengeid = tablelookupcolumnforrow( tablename, j, 0 );
                
                if ( challengeid != "<dev string:x8c>" && strisint( tablelookupcolumnforrow( tablename, j, 0 ) ) )
                {
                    challengestring = tablelookupcolumnforrow( tablename, j, 5 );
                    type = tablelookupcolumnforrow( tablename, j, 3 );
                    challengetier = int( tablelookupcolumnforrow( tablename, j, 1 ) );
                    challengetierstring = "<dev string:x8c>" + challengetier;
                    
                    if ( challengetier < 10 )
                    {
                        challengetierstring = "<dev string:x60>" + challengetier;
                    }
                    
                    name = tablelookupcolumnforrow( tablename, j, 5 );
                    devgui_cmd_challenge_path = notif_challenges_devgui_base + function_9e72a96( type ) + "<dev string:x2d3>" + function_9e72a96( name ) + "<dev string:x2d3>" + challengetierstring + "<dev string:x8f1>" + challengeid;
                    util::waittill_can_add_debug_command();
                    adddebugcommand( devgui_cmd_challenge_path + "<dev string:x8fa>" + "<dev string:x900>" + "<dev string:x905>" + "<dev string:x90e>" + "<dev string:x65>" + j + "<dev string:x905>" + "<dev string:x927>" + "<dev string:x65>" + i + "<dev string:x905>" + "<dev string:x7da>" + "<dev string:x942>" + "<dev string:x85>" );
                    
                    if ( int( challengeid ) % 10 )
                    {
                        waitframe( 1 );
                    }
                }
            }
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x33e177e7, Offset: 0x22d0
    // Size: 0x94, Type: dev
    function function_9eac333e()
    {
        tablenum = getdvarint( #"hash_2ef0f120f21f3135", 0 );
        row = getdvarint( #"hash_7cc425fc91c8c499", 0 );
        luinotifyevent( #"hash_405727f8a59698b1", 2, tablenum - 1, row );
    }

#/
