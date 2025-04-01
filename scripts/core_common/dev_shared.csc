#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;

#namespace dev_shared;

/#

    // Namespace dev_shared/dev_shared
    // Params 0, eflags: 0x1
    // Checksum 0xac2ae352, Offset: 0x90
    // Size: 0x44, Type: dev
    function autoexec init()
    {
        callback::on_localclient_connect( &function_b49b1b6b );
        self function_cbe4bccb();
    }

    // Namespace dev_shared/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe8ae0fca, Offset: 0xe0
    // Size: 0x284, Type: dev
    function function_b49b1b6b( localclientnum )
    {
        var_39073e7a = undefined;
        var_b49b1b6b = undefined;
        a_effects = array( "<dev string:x38>", "<dev string:x60>", "<dev string:x8e>", "<dev string:xb8>", "<dev string:xe6>", "<dev string:x117>", "<dev string:x148>", "<dev string:x181>" );
        var_767a6d22 = 0;
        
        while ( true )
        {
            n_dist = getdvarint( #"hash_4348ec71a8b13ef1", 0 );
            var_114d05f = int( min( getdvarint( #"hash_4ead99200e3cc72c", 0 ), a_effects.size - 1 ) );
            
            if ( n_dist > 0 )
            {
                if ( var_114d05f != var_767a6d22 && isdefined( var_b49b1b6b ) )
                {
                    killfx( localclientnum, var_b49b1b6b );
                    var_b49b1b6b = undefined;
                }
                
                if ( !isdefined( var_39073e7a ) )
                {
                    var_39073e7a = util::spawn_model( localclientnum, "<dev string:x1b1>" );
                }
                
                if ( !isdefined( var_b49b1b6b ) )
                {
                    var_b49b1b6b = util::playfxontag( localclientnum, a_effects[ var_114d05f ], var_39073e7a, "<dev string:x1b1>" );
                }
                
                v_pos = getcamposbylocalclientnum( localclientnum );
                v_ang = getcamanglesbylocalclientnum( localclientnum );
                v_forward = anglestoforward( v_ang );
                var_39073e7a.origin = v_pos + v_forward * n_dist;
                var_39073e7a.angles = v_ang;
            }
            else if ( isdefined( var_39073e7a ) )
            {
                killfx( localclientnum, var_b49b1b6b );
                var_39073e7a delete();
                var_b49b1b6b = undefined;
            }
            
            var_767a6d22 = var_114d05f;
            waitframe( 1 );
        }
    }

    // Namespace dev_shared/dev_shared
    // Params 3, eflags: 0x0
    // Checksum 0xfa6f5aa5, Offset: 0x370
    // Size: 0x5c, Type: dev
    function add_devgui_cmd( localclientnum, menu_path, cmds )
    {
        adddebugcommand( localclientnum, "<dev string:x1bf>" + menu_path + "<dev string:x1cf>" + cmds + "<dev string:x1d6>" );
    }

    // Namespace dev_shared/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x58f31c5e, Offset: 0x3d8
    // Size: 0x84, Type: dev
    function function_cbe4bccb()
    {
        self thread function_681e8519();
        self thread function_f3346975();
        add_devgui_cmd( 0, "<dev string:x1dc>", "<dev string:x204>" );
        add_devgui_cmd( 0, "<dev string:x218>", "<dev string:x241>" );
    }

    // Namespace dev_shared/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0xd8d273a7, Offset: 0x468
    // Size: 0x2d0, Type: dev
    function function_f3346975()
    {
        mode = currentsessionmode();
        
        while ( mode >= 4 )
        {
            mode = currentsessionmode();
            wait 1;
        }
        
        bodies = getallcharacterbodies( mode );
        
        foreach ( playerbodytype in bodies )
        {
            body_name = function_2c6232e5( makelocalizedstring( getcharacterdisplayname( playerbodytype, mode ) ) ) + "<dev string:x255>" + function_9e72a96( getcharacterassetname( playerbodytype, mode ) );
            add_devgui_cmd( 0, "<dev string:x25a>" + body_name + "<dev string:x27d>", "<dev string:x289>" + playerbodytype + "<dev string:x29d>" );
            outfitcount = function_d299ef16( playerbodytype, mode );
            
            for (outfitindex = 0; outfitindex < outfitcount; outfitindex++) {
                var_9cf37283 = function_d7c3cf6c( playerbodytype, outfitindex, mode );
                
                if ( var_9cf37283.valid )
                {
                    var_346660ac = function_2c6232e5( makelocalizedstring( var_9cf37283.var_74996050 ) );
                    var_1bf829f2 = outfitindex + "<dev string:x255>" + var_346660ac + "<dev string:x255>" + function_9e72a96( var_9cf37283.namehash ) + "<dev string:x2a3>" + outfitindex;
                    add_devgui_cmd( 0, "<dev string:x25a>" + body_name + "<dev string:x2a8>" + var_1bf829f2, "<dev string:x289>" + playerbodytype + "<dev string:x2ad>" + outfitindex );
                }
            }
        }
    }

    // Namespace dev_shared/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x943d163b, Offset: 0x740
    // Size: 0x44, Type: dev
    function function_2c6232e5( in_string )
    {
        out_string = strreplace( in_string, "<dev string:x2a3>", "<dev string:x2b2>" );
        return out_string;
    }

    // Namespace dev_shared/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x4f2ed673, Offset: 0x790
    // Size: 0x214, Type: dev
    function function_681e8519()
    {
        level endon( #"game_ended" );
        a_weapons = enumerateweapons( "<dev string:x2b6>" );
        var_cab50ba0 = [];
        a_grenades = [];
        a_equipment = [];
        
        for (i = 0; i < a_weapons.size; i++) {
            if ( strstartswith( getweaponname( a_weapons[ i ] ), "<dev string:x2c0>" ) )
            {
                arrayinsert( a_equipment, a_weapons[ i ], 0 );
                continue;
            }
            
            if ( is_true( a_weapons[ i ].isprimary ) && isdefined( a_weapons[ i ].worldmodel ) )
            {
                arrayinsert( var_cab50ba0, a_weapons[ i ], 0 );
                continue;
            }
            
            if ( is_true( a_weapons[ i ].isgrenadeweapon ) )
            {
                arrayinsert( a_grenades, a_weapons[ i ], 0 );
            }
        }
        
        player_devgui_base = "<dev string:x2c7>";
        level thread function_30285c9c( player_devgui_base, "<dev string:x2df>", var_cab50ba0, "<dev string:x2fb>" );
        level thread function_30285c9c( player_devgui_base, "<dev string:x2df>", a_grenades, "<dev string:x303>" );
        level thread function_30285c9c( player_devgui_base, "<dev string:x2df>", a_equipment, "<dev string:x30f>" );
    }

    // Namespace dev_shared/dev_shared
    // Params 4, eflags: 0x0
    // Checksum 0x8ad00599, Offset: 0x9b0
    // Size: 0x124, Type: dev
    function function_30285c9c( root, pname, a_weapons, weapon_type )
    {
        level endon( #"game_ended" );
        player_devgui_root = root + pname + "<dev string:x2a8>";
        
        if ( isdefined( a_weapons ) )
        {
            for (i = 0; i < a_weapons.size; i++) {
                name = getweaponname( a_weapons[ i ] );
                displayname = a_weapons[ i ].displayname;
                
                if ( displayname == #"" )
                {
                    displayname = "<dev string:x31c>";
                }
                else
                {
                    displayname = "<dev string:x323>" + makelocalizedstring( displayname ) + "<dev string:x329>";
                }
                
                function_8c49f3a8( player_devgui_root, weapon_type, name, displayname );
            }
        }
    }

    // Namespace dev_shared/dev_shared
    // Params 4, eflags: 0x0
    // Checksum 0xb2ba5974, Offset: 0xae0
    // Size: 0x7c, Type: dev
    function function_8c49f3a8( root, weapon_type, weap_name, displayname )
    {
        command = root + weapon_type + "<dev string:x2a8>" + weap_name + displayname + "<dev string:x32e>" + weap_name + "<dev string:x33a>";
        adddebugcommand( 0, command );
    }

#/
