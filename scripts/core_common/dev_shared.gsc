#using scripts\core_common\gestures;
#using scripts\core_common\math_shared;
#using scripts\core_common\util_shared;

#namespace dev;

/#

    // Namespace dev/dev_shared
    // Params 5, eflags: 0x0
    // Checksum 0x454af3db, Offset: 0x98
    // Size: 0xb4, Type: dev
    function debug_sphere( origin, radius, color, alpha, time )
    {
        if ( !isdefined( time ) )
        {
            time = 1000;
        }
        
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        sides = int( 10 * ( 1 + int( radius ) % 100 ) );
        sphere( origin, radius, color, alpha, 1, sides, time );
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0xddb4171, Offset: 0x158
    // Size: 0x3c6, Type: dev
    function devgui_test_chart_think()
    {
        waitframe( 1 );
        old_val = getdvarint( #"scr_debug_test_chart", 0 );
        scale = 120;
        
        for ( ;; )
        {
            val = getdvarint( #"scr_debug_test_chart", 0 );
            
            if ( old_val != val )
            {
                if ( isdefined( level.test_chart_model ) )
                {
                    level.test_chart_model delete();
                    level.test_chart_model = undefined;
                }
                
                if ( val )
                {
                    player = getplayers()[ 0 ];
                    direction = player getplayerangles();
                    direction_vec = anglestoforward( ( 0, direction[ 1 ], 0 ) );
                    direction_vec = ( direction_vec[ 0 ] * scale, direction_vec[ 1 ] * scale, direction_vec[ 2 ] * scale );
                    level.test_chart_model = spawn( "<dev string:x38>", player geteye() + direction_vec );
                    level.test_chart_model setmodel( #"test_chart_model" );
                    level.test_chart_model.angles = ( 0, direction[ 1 ], 0 ) + ( 0, 90, 0 );
                }
            }
            
            if ( val )
            {
                player = getplayers()[ 0 ];
                
                if ( val == 1 )
                {
                    level.test_chart_model setmodel( #"test_chart_model" );
                }
                else if ( val == 2 )
                {
                    level.test_chart_model setmodel( #"test_chart_model_2" );
                }
                else if ( val == 3 )
                {
                    level.test_chart_model setmodel( #"test_chart_model_3" );
                }
                
                direction = player getplayerangles();
                direction_vec = anglestoforward( ( 0, direction[ 1 ], 0 ) );
                direction_vec = ( direction_vec[ 0 ] * scale, direction_vec[ 1 ] * scale, direction_vec[ 2 ] * scale );
                level.test_chart_model.angles = ( 0, direction[ 1 ], 0 ) + ( 0, 90, 0 );
                level.test_chart_model.origin = player geteye() + direction_vec;
                
                if ( player meleebuttonpressed() )
                {
                    scale += 10;
                }
                
                if ( player sprintbuttonpressed() )
                {
                    scale -= 10;
                }
            }
            
            old_val = val;
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x6d30a858, Offset: 0x528
    // Size: 0xa64, Type: dev
    function updateminimapsetting()
    {
        requiredmapaspectratio = getdvarfloat( #"scr_requiredmapaspectratio", 0 );
        
        if ( !isdefined( level.minimapheight ) )
        {
            setdvar( #"scr_minimap_height", 0 );
            level.minimapheight = 0;
        }
        
        minimapheight = getdvarfloat( #"scr_minimap_height", 0 );
        
        if ( minimapheight != level.minimapheight )
        {
            if ( minimapheight <= 0 )
            {
                util::gethostplayer() cameraactivate( 0 );
                level.minimapheight = minimapheight;
                level notify( #"end_draw_map_bounds" );
            }
            
            if ( minimapheight > 0 )
            {
                level.minimapheight = minimapheight;
                players = getplayers();
                
                if ( players.size > 0 )
                {
                    player = util::gethostplayer();
                    corners = getentarray( "<dev string:x48>", "<dev string:x5a>" );
                    
                    if ( corners.size == 2 )
                    {
                        viewpos = corners[ 0 ].origin + corners[ 1 ].origin;
                        viewpos = ( viewpos[ 0 ] * 0.5, viewpos[ 1 ] * 0.5, viewpos[ 2 ] * 0.5 );
                        level thread minimapwarn( corners );
                        maxcorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        mincorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        
                        if ( corners[ 1 ].origin[ 0 ] > corners[ 0 ].origin[ 0 ] )
                        {
                            maxcorner = ( corners[ 1 ].origin[ 0 ], maxcorner[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( corners[ 1 ].origin[ 0 ], mincorner[ 1 ], mincorner[ 2 ] );
                        }
                        
                        if ( corners[ 1 ].origin[ 1 ] > corners[ 0 ].origin[ 1 ] )
                        {
                            maxcorner = ( maxcorner[ 0 ], corners[ 1 ].origin[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( mincorner[ 0 ], corners[ 1 ].origin[ 1 ], mincorner[ 2 ] );
                        }
                        
                        viewpostocorner = maxcorner - viewpos;
                        viewpos = ( viewpos[ 0 ], viewpos[ 1 ], viewpos[ 2 ] + minimapheight );
                        northvector = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
                        eastvector = ( northvector[ 1 ], 0 - northvector[ 0 ], 0 );
                        disttotop = vectordot( northvector, viewpostocorner );
                        
                        if ( disttotop < 0 )
                        {
                            disttotop = 0 - disttotop;
                        }
                        
                        disttoside = vectordot( eastvector, viewpostocorner );
                        
                        if ( disttoside < 0 )
                        {
                            disttoside = 0 - disttoside;
                        }
                        
                        if ( requiredmapaspectratio > 0 )
                        {
                            mapaspectratio = disttoside / disttotop;
                            
                            if ( mapaspectratio < requiredmapaspectratio )
                            {
                                incr = requiredmapaspectratio / mapaspectratio;
                                disttoside *= incr;
                                addvec = vecscale( eastvector, vectordot( eastvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                            else
                            {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop *= incr;
                                addvec = vecscale( northvector, vectordot( northvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                        }
                        
                        if ( level.console )
                        {
                            aspectratioguess = 1.77778;
                            angleside = 2 * atan( disttoside * 0.8 / minimapheight );
                            angletop = 2 * atan( disttotop * aspectratioguess * 0.8 / minimapheight );
                        }
                        else
                        {
                            aspectratioguess = 1.33333;
                            angleside = 2 * atan( disttoside / minimapheight );
                            angletop = 2 * atan( disttotop * aspectratioguess / minimapheight );
                        }
                        
                        if ( angleside > angletop )
                        {
                            angle = angleside;
                        }
                        else
                        {
                            angle = angletop;
                        }
                        
                        znear = minimapheight - 1000;
                        
                        if ( znear < 16 )
                        {
                            znear = 16;
                        }
                        
                        if ( znear > 10000 )
                        {
                            znear = 10000;
                        }
                        
                        player camerasetposition( viewpos, ( 90, getnorthyaw(), 0 ) );
                        player cameraactivate( 1 );
                        player takeallweapons();
                        setdvar( #"cg_drawgun", 0 );
                        setdvar( #"cg_draw2d", 0 );
                        setdvar( #"cg_drawfps", 0 );
                        setdvar( #"fx_enable", 0 );
                        setdvar( #"r_fog", 0 );
                        setdvar( #"r_highloddist", 0 );
                        setdvar( #"r_znear", znear );
                        setdvar( #"r_lodscalerigid", 0.1 );
                        setdvar( #"cg_drawversion", 0 );
                        setdvar( #"sm_enable", 1 );
                        setdvar( #"player_view_pitch_down", 90 );
                        setdvar( #"player_view_pitch_up", 0 );
                        setdvar( #"cg_fov", angle );
                        setdvar( #"cg_drawminimap", 1 );
                        setdvar( #"r_umbranumthreads", 1 );
                        setdvar( #"r_umbradistancescale", 0.1 );
                        setdvar( #"r_uselensfov", 0 );
                        setdvar( #"hash_5ee9a4ac16993e50", 1 );
                        setdvar( #"debug_show_viewpos", 0 );
                        thread drawminimapbounds( viewpos, mincorner, maxcorner );
                    }
                    else
                    {
                        println( "<dev string:x68>" );
                    }
                    
                    return;
                }
                
                setdvar( #"scr_minimap_height", 0 );
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x73c388a7, Offset: 0xf98
    // Size: 0x44, Type: dev
    function vecscale( vec, scalar )
    {
        return ( vec[ 0 ] * scalar, vec[ 1 ] * scalar, vec[ 2 ] * scalar );
    }

    // Namespace dev/dev_shared
    // Params 3, eflags: 0x0
    // Checksum 0xf9cecd6f, Offset: 0xfe8
    // Size: 0x36e, Type: dev
    function drawminimapbounds( viewpos, mincorner, maxcorner )
    {
        level notify( #"end_draw_map_bounds" );
        level endon( #"end_draw_map_bounds" );
        viewheight = viewpos[ 2 ] - maxcorner[ 2 ];
        north = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
        diaglen = length( mincorner - maxcorner );
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize( ( mincorneroffset[ 0 ], mincorneroffset[ 1 ], 0 ) );
        mincorner += vecscale( mincorneroffset, diaglen * 1 / 800 );
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize( ( maxcorneroffset[ 0 ], maxcorneroffset[ 1 ], 0 ) );
        maxcorner += vecscale( maxcorneroffset, diaglen * 1 / 800 );
        diagonal = maxcorner - mincorner;
        side = vecscale( north, vectordot( diagonal, north ) );
        sidenorth = vecscale( north, abs( vectordot( diagonal, north ) ) );
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale( mincorner + maxcorner, 0.5 ) + vecscale( sidenorth, 0.51 );
        textscale = diaglen * 0.003;
        
        while ( true )
        {
            line( corner0, corner1 );
            line( corner1, corner2 );
            line( corner2, corner3 );
            line( corner3, corner0 );
            print3d( toppos, "<dev string:xb4>", ( 1, 1, 1 ), 1, textscale );
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x34db792f, Offset: 0x1360
    // Size: 0x10, Type: dev
    function minimapwarn( *corners )
    {
        
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x1835a5cc, Offset: 0x1378
    // Size: 0x120, Type: dev
    function function_e5746ec1()
    {
        host = util::gethostplayer();
        all_players = getplayers();
        var_1645eaac = isdefined( host ) && host getstance() == "<dev string:xc4>";
        
        if ( !isdefined( host ) || var_1645eaac )
        {
            return all_players;
        }
        
        all_players = arraysort( all_players, host.origin );
        players = [];
        
        if ( all_players.size == 1 || host getstance() == "<dev string:xcd>" )
        {
            players[ 0 ] = host;
        }
        else
        {
            players[ 0 ] = all_players[ 1 ];
        }
        
        return players;
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0xdece4655, Offset: 0x14a0
    // Size: 0xd0, Type: dev
    function function_5639909a( bodytype, outfitindex )
    {
        players = function_e5746ec1();
        
        foreach ( player in players )
        {
            player setcharacterbodytype( bodytype );
            player setcharacteroutfit( outfitindex );
        }
    }

    // Namespace dev/dev_shared
    // Params 4, eflags: 0x0
    // Checksum 0x4fa55e2a, Offset: 0x1578
    // Size: 0x298, Type: dev
    function function_f413b4d5( bodytype, outfitindex, var_c1154821, index )
    {
        players = function_e5746ec1();
        
        if ( var_c1154821 == "<dev string:xd6>" )
        {
            function_5639909a( bodytype, outfitindex );
            var_9cf37283 = function_d7c3cf6c( bodytype, outfitindex, currentsessionmode() );
            preset = var_9cf37283.presets[ index ];
            
            foreach ( player in players )
            {
                foreach ( type, data in level.var_1a409216 )
                {
                    if ( type != 7 && type != 1 )
                    {
                        player function_ab96a9b5( data.field, preset.parts[ type ] );
                    }
                }
            }
            
            return;
        }
        
        foreach ( player in players )
        {
            if ( var_c1154821 == "<dev string:xe0>" )
            {
                player setcharacterwarpaintoutfit( outfitindex );
            }
            
            player function_ab96a9b5( var_c1154821, index );
        }
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x6e84171b, Offset: 0x1818
    // Size: 0x3b2, Type: dev
    function body_customization_process_command( character_index )
    {
        println( "<dev string:xec>" + character_index + "<dev string:x114>" );
        split = strtok( character_index, "<dev string:x119>" );
        
        switch ( split.size )
        {
            case 1:
                command0 = strtok( split[ 0 ], "<dev string:x11e>" );
                bodytype = int( command0[ 1 ] );
                println( "<dev string:x123>" + bodytype + "<dev string:x162>" );
                function_5639909a( bodytype, 0 );
                break;
            case 2:
                command0 = strtok( split[ 0 ], "<dev string:x11e>" );
                bodytype = int( command0[ 1 ] );
                command1 = strtok( split[ 1 ], "<dev string:x11e>" );
                outfitindex = int( command1[ 1 ] );
                println( "<dev string:x123>" + bodytype + "<dev string:x167>" + outfitindex + "<dev string:x162>" );
                function_5639909a( bodytype, outfitindex );
                break;
            case 3:
                command0 = strtok( split[ 0 ], "<dev string:x11e>" );
                bodytype = int( command0[ 1 ] );
                command1 = strtok( split[ 1 ], "<dev string:x11e>" );
                outfitindex = int( command1[ 1 ] );
                var_e7f74d2b = strtok( split[ 2 ], "<dev string:x11e>" );
                var_c1154821 = var_e7f74d2b[ 0 ];
                index = int( var_e7f74d2b[ 1 ] );
                println( "<dev string:x178>" + bodytype + "<dev string:x167>" + outfitindex + "<dev string:x1ae>" + var_c1154821 + "<dev string:x1b8>" + index + "<dev string:x162>" );
                function_f413b4d5( bodytype, outfitindex, var_c1154821, index );
                break;
            default:
                break;
        }
    }

    // Namespace dev/dev_shared
    // Params 5, eflags: 0x0
    // Checksum 0x4e50a024, Offset: 0x1bd8
    // Size: 0x130, Type: dev
    function function_3cec5609( &arr, devgui_path, bodytype, outfitindex, optiontype )
    {
        foreach ( index, option in arr )
        {
            if ( option.isvalid )
            {
                util::add_debug_command( devgui_path + index + "<dev string:x1bd>" + "<dev string:x1c8>" + "<dev string:x1b8>" + "<dev string:x1d7>" + bodytype + "<dev string:x119>" + "<dev string:x1e4>" + outfitindex + "<dev string:x119>" + optiontype + "<dev string:x11e>" + index + "<dev string:x1ef>" );
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x471fd59d, Offset: 0x1d10
    // Size: 0x44, Type: dev
    function function_c807b11d( in_string )
    {
        out_string = strreplace( in_string, "<dev string:x11e>", "<dev string:x1f6>" );
        return out_string;
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x7b6eebba, Offset: 0x1d60
    // Size: 0x44, Type: dev
    function function_2c6232e5( in_string )
    {
        out_string = strreplace( in_string, "<dev string:x11e>", "<dev string:x1fb>" );
        return out_string;
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x71073529, Offset: 0x1db0
    // Size: 0x160, Type: dev
    function function_970d4891( mode )
    {
        bodies = getallcharacterbodies( mode );
        
        foreach ( playerbodytype in bodies )
        {
            body_name = function_2c6232e5( makelocalizedstring( getcharacterdisplayname( playerbodytype, mode ) ) ) + "<dev string:x1ff>" + function_9e72a96( getcharacterassetname( playerbodytype, mode ) );
            util::add_devgui( "<dev string:x204>" + body_name + "<dev string:x222>", "<dev string:x238>" + "<dev string:x240>" + "<dev string:x1b8>" + body_name );
        }
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0xd2cd5b34, Offset: 0x1f18
    // Size: 0x828, Type: dev
    function body_customization_populate( mode, var_ef4940a5 )
    {
        bodies = getallcharacterbodies( mode );
        body_customization_devgui_base = "<dev string:x261>" + "<dev string:x204>";
        level.var_1a409216 = [ { #path:"<dev string:x271>", #field:"<dev string:x27d>" }, { #path:"<dev string:x285>", #field:"<dev string:x295>" }, { #path:"<dev string:x29e>", #field:"<dev string:x2ac>" }, { #path:"<dev string:x2b4>", #field:"<dev string:x2c7>" }, { #path:"<dev string:x2d3>", #field:"<dev string:x2df>" }, { #path:"<dev string:x2e7>", #field:"<dev string:x2fb>" }, { #path:"<dev string:x306>", #field:"<dev string:x316>" }, { #path:"<dev string:x31f>", #field:"<dev string:xe0>" } ];
        
        foreach ( playerbodytype in bodies )
        {
            body_name = function_2c6232e5( makelocalizedstring( getcharacterdisplayname( playerbodytype, mode ) ) ) + "<dev string:x1ff>" + function_9e72a96( getcharacterassetname( playerbodytype, mode ) );
            
            if ( isdefined( var_ef4940a5 ) && var_ef4940a5 != body_name )
            {
                continue;
            }
            
            util::add_debug_command( body_customization_devgui_base + body_name + "<dev string:x337>" + "<dev string:x1bd>" + "<dev string:x1c8>" + "<dev string:x1b8>" + "<dev string:x1d7>" + playerbodytype + "<dev string:x1ef>" );
            outfitcount = function_d299ef16( playerbodytype, mode );
            
            for (outfitindex = 0; outfitindex < outfitcount; outfitindex++) {
                var_9cf37283 = function_d7c3cf6c( playerbodytype, outfitindex, mode );
                
                if ( var_9cf37283.valid )
                {
                    var_346660ac = function_2c6232e5( makelocalizedstring( var_9cf37283.var_74996050 ) );
                    var_1bf829f2 = outfitindex + "<dev string:x1ff>" + var_346660ac + "<dev string:x1ff>" + function_c807b11d( function_9e72a96( var_9cf37283.namehash ) ) + "<dev string:x11e>" + outfitindex;
                    var_a818c4e = body_customization_devgui_base + body_name + "<dev string:x343>" + var_1bf829f2;
                    util::add_debug_command( var_a818c4e + "<dev string:x337>" + "<dev string:x1bd>" + "<dev string:x1c8>" + "<dev string:x1b8>" + "<dev string:x1d7>" + playerbodytype + "<dev string:x119>" + "<dev string:x1e4>" + outfitindex + "<dev string:x1ef>" );
                    
                    foreach ( type, data in level.var_1a409216 )
                    {
                        foreach ( index, option in var_9cf37283.options[ type ] )
                        {
                            if ( option.isvalid )
                            {
                                util::waittill_can_add_debug_command();
                                util::add_debug_command( var_a818c4e + "<dev string:x343>" + data.path + "<dev string:x1b8>" + index + "<dev string:x11e>" + index + "<dev string:x1bd>" + "<dev string:x1c8>" + "<dev string:x1b8>" + "<dev string:x1d7>" + playerbodytype + "<dev string:x119>" + "<dev string:x1e4>" + outfitindex + "<dev string:x119>" + data.field + "<dev string:x11e>" + index + "<dev string:x1ef>" );
                            }
                        }
                    }
                    
                    for (presetindex = 0; presetindex < var_9cf37283.presets.size; presetindex++) {
                        preset = var_9cf37283.presets[ presetindex ];
                        
                        if ( !preset.isvalid )
                        {
                            continue;
                        }
                        
                        util::waittill_can_add_debug_command();
                        util::add_debug_command( var_a818c4e + "<dev string:x343>" + "<dev string:x348>" + presetindex + "<dev string:x35b>" + function_9e72a96( preset.lootid ) + "<dev string:x114>" + "<dev string:x11e>" + presetindex + "<dev string:x1bd>" + "<dev string:x1c8>" + "<dev string:x1b8>" + "<dev string:x1d7>" + playerbodytype + "<dev string:x119>" + "<dev string:x1e4>" + outfitindex + "<dev string:x119>" + "<dev string:xd6>" + "<dev string:x11e>" + presetindex + "<dev string:x1ef>" );
                    }
                }
                
                if ( isdefined( var_ef4940a5 ) )
                {
                    util::remove_devgui( "<dev string:x204>" + body_name + "<dev string:x361>" );
                }
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x7b819b87, Offset: 0x2748
    // Size: 0x264, Type: dev
    function function_986c93f0()
    {
        roleindex = getdvarint( #"hash_66e77cf688988460", 0 );
        
        if ( roleindex < 0 )
        {
            return;
        }
        
        players = getplayers();
        
        if ( players.size <= 0 )
        {
            return;
        }
        
        vehs = getvehiclearray();
        v = arraygetclosest( players[ 0 ].origin, vehs );
        
        if ( !isalive( v ) )
        {
            return;
        }
        
        if ( isdefined( v ) && isdefined( v.vehicleassembly ) )
        {
            rolecount = v function_545738a();
            
            if ( rolecount > 0 && roleindex < rolecount )
            {
                var_8de3e761 = v function_b655eac6();
                
                if ( var_8de3e761 != roleindex )
                {
                    v function_7be764cc( roleindex );
                }
                
                namehash = v function_d4e2ed8a( roleindex );
                
                if ( isdefined( namehash ) )
                {
                    pos = v.origin + ( 0, 0, 100 );
                    text = "<dev string:x375>" + roleindex + "<dev string:x380>" + function_9e72a96( namehash ) + "<dev string:x386>";
                    color = ( 1, 1, 1 );
                    alpha = 1;
                    scale = 1;
                    duration = 10;
                    centered = 1;
                    print3d( pos, text, color, alpha, scale, duration, centered );
                }
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0xaa32da6, Offset: 0x29b8
    // Size: 0x104, Type: dev
    function function_6d793eb9( hornindex )
    {
        players = getplayers();
        
        if ( players.size <= 0 )
        {
            return;
        }
        
        var_e2bbb439 = getscriptbundlelist( #"hash_4bea1d6b321100bb" );
        
        if ( !isdefined( var_e2bbb439 ) )
        {
            return;
        }
        
        vehicles = getvehiclearray();
        vehicle = arraygetclosest( players[ 0 ].origin, vehicles );
        
        if ( !isalive( vehicle ) )
        {
            return;
        }
        
        var_a0e911e = var_e2bbb439[ hornindex ];
        
        if ( !isdefined( var_a0e911e ) )
        {
            return;
        }
        
        vehicle function_3e79d199( var_a0e911e );
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x22f772ea, Offset: 0x2ac8
    // Size: 0x31c, Type: dev
    function body_customization_devgui( mode )
    {
        function_970d4891( mode );
        wait 1;
        var_35383820 = 0;
        adddebugcommand( "<dev string:x38b>" + "<dev string:x3c2>" );
        var_a02b3930 = 0;
        
        for ( ;; )
        {
            var_f12e4923 = getdvarstring( #"hash_2195b248bfe1371e", "<dev string:x1fb>" );
            
            if ( var_f12e4923 != "<dev string:x1fb>" )
            {
                level thread body_customization_populate( mode, var_f12e4923 );
                setdvar( #"hash_2195b248bfe1371e", "<dev string:x1fb>" );
            }
            
            character_index = getdvarstring( #"char_devgui", "<dev string:x1fb>" );
            
            if ( character_index != "<dev string:x1fb>" )
            {
                body_customization_process_command( character_index );
                setdvar( #"char_devgui", "<dev string:x1fb>" );
            }
            
            if ( getdvarint( #"hash_50a9783feccc726d", 0 ) )
            {
                function_986c93f0();
            }
            
            var_dc07f52f = getdvarint( #"hash_4566ad68e232b908", 0 );
            
            if ( var_a02b3930 != var_dc07f52f )
            {
                function_6d793eb9( var_dc07f52f );
            }
            
            var_a02b3930 = var_dc07f52f;
            var_32e0e50a = getdvarint( #"hash_4976075f146e1fa2", 0 );
            
            if ( var_35383820 != var_32e0e50a )
            {
                players = getplayers();
                iprintln( "<dev string:x3dc>" + var_32e0e50a + "<dev string:x386>" );
                
                foreach ( player in players )
                {
                    if ( !isdefined( player ) )
                    {
                        continue;
                    }
                    
                    player function_97cf79d8( var_32e0e50a );
                }
            }
            
            var_35383820 = var_32e0e50a;
            wait 0.5;
        }
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x5c367c5a, Offset: 0x2df0
    // Size: 0xbc, Type: dev
    function add_perk_devgui( name, specialties )
    {
        perk_devgui_base = "<dev string:x40c>";
        perk_name = name;
        test = perk_devgui_base + perk_name + "<dev string:x1bd>" + "<dev string:x433>" + "<dev string:x1b8>" + specialties + "<dev string:x1ef>";
        util::add_debug_command( perk_devgui_base + perk_name + "<dev string:x1bd>" + "<dev string:x433>" + "<dev string:x1b8>" + specialties + "<dev string:x1ef>" );
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0xe1497b32, Offset: 0x2eb8
    // Size: 0xcc, Type: dev
    function function_373068ca( name, postfix )
    {
        if ( !isdefined( postfix ) )
        {
            postfix = "<dev string:x1fb>";
        }
        
        if ( !isdefined( name ) )
        {
            return;
        }
        
        if ( name == "<dev string:x1fb>" )
        {
            return;
        }
        
        util::waittill_can_add_debug_command();
        talentname = "<dev string:x1fb>" + name + postfix;
        cmd = "<dev string:x238>" + "<dev string:x443>" + "<dev string:x1b8>" + talentname;
        util::add_devgui( "<dev string:x455>" + talentname, cmd );
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x872159a6, Offset: 0x2f90
    // Size: 0xdc, Type: dev
    function function_8263c0d5( name, postfix )
    {
        if ( !isdefined( postfix ) )
        {
            postfix = "<dev string:x1fb>";
        }
        
        if ( !isdefined( name ) )
        {
            return;
        }
        
        if ( name == "<dev string:x1fb>" )
        {
            return;
        }
        
        util::waittill_can_add_debug_command();
        talentname = "<dev string:x485>" + getsubstr( name, 7 ) + postfix;
        cmd = "<dev string:x238>" + "<dev string:x48f>" + "<dev string:x1b8>" + talentname;
        util::add_devgui( "<dev string:x4a0>" + talentname, cmd );
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x463cb732, Offset: 0x3078
    // Size: 0x184, Type: dev
    function function_a432e633()
    {
        gesture = getdvarstring( #"scr_givegesture" );
        
        if ( isdefined( gesture ) && gesture != "<dev string:x1fb>" )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                player gestures::clear_gesture();
                player.loadoutgesture = getweapon( gesture );
                
                if ( isdefined( player.loadoutgesture ) && player.loadoutgesture != level.weaponnone )
                {
                    player gestures::give_gesture( player.loadoutgesture );
                }
            }
        }
        
        setdvar( #"scr_givegesture", "<dev string:x1fb>" );
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0xf2bfa0a8, Offset: 0x3208
    // Size: 0x90, Type: dev
    function function_487bf571()
    {
        for ( ;; )
        {
            gesture = getdvarstring( #"scr_givegesture" );
            
            if ( gesture != "<dev string:x1fb>" )
            {
                function_a432e633();
            }
            
            setdvar( #"scr_givegesture", "<dev string:x1fb>" );
            wait 0.5;
        }
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x99d8ddf8, Offset: 0x32a0
    // Size: 0xc0, Type: dev
    function get_lookat_origin( player )
    {
        angles = player getplayerangles();
        forward = anglestoforward( angles );
        dir = vectorscale( forward, 8000 );
        eye = player geteye();
        trace = bullettrace( eye, eye + dir, 0, undefined );
        return trace[ #"position" ];
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x5f70f463, Offset: 0x3368
    // Size: 0x6c, Type: dev
    function draw_pathnode( node, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 0, 1 );
        }
        
        box( node.origin, ( -16, -16, 0 ), ( 16, 16, 16 ), 0, color, 1, 0, 1 );
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x1fca195f, Offset: 0x33e0
    // Size: 0x4e, Type: dev
    function draw_pathnode_think( node, color )
    {
        level endon( #"draw_pathnode_stop" );
        
        for ( ;; )
        {
            draw_pathnode( node, color );
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x11866367, Offset: 0x3438
    // Size: 0x20, Type: dev
    function draw_pathnodes_stop()
    {
        wait 5;
        level notify( #"draw_pathnode_stop" );
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0xde43c623, Offset: 0x3460
    // Size: 0x120, Type: dev
    function node_get( player )
    {
        for ( ;; )
        {
            waitframe( 1 );
            origin = get_lookat_origin( player );
            node = getnearestnode( origin );
            
            if ( !isdefined( node ) )
            {
                continue;
            }
            
            if ( player buttonpressed( "<dev string:x4ca>" ) )
            {
                return node;
            }
            else if ( player buttonpressed( "<dev string:x4d6>" ) )
            {
                return undefined;
            }
            
            if ( node.type == #"path" )
            {
                draw_pathnode( node, ( 1, 0, 1 ) );
                continue;
            }
            
            draw_pathnode( node, ( 0.85, 0.85, 0.1 ) );
        }
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0xff8a09fa, Offset: 0x3588
    // Size: 0x1a2, Type: dev
    function dev_get_node_pair()
    {
        player = util::gethostplayer();
        start = undefined;
        
        while ( !isdefined( start ) )
        {
            start = node_get( player );
            
            if ( player buttonpressed( "<dev string:x4d6>" ) )
            {
                level notify( #"draw_pathnode_stop" );
                return undefined;
            }
        }
        
        level thread draw_pathnode_think( start, ( 0, 1, 0 ) );
        
        while ( player buttonpressed( "<dev string:x4ca>" ) )
        {
            waitframe( 1 );
        }
        
        end = undefined;
        
        while ( !isdefined( end ) )
        {
            end = node_get( player );
            
            if ( player buttonpressed( "<dev string:x4d6>" ) )
            {
                level notify( #"draw_pathnode_stop" );
                return undefined;
            }
        }
        
        level thread draw_pathnode_think( end, ( 0, 1, 0 ) );
        level thread draw_pathnodes_stop();
        array = [];
        array[ 0 ] = start;
        array[ 1 ] = end;
        return array;
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x8a7d183a, Offset: 0x3738
    // Size: 0x54, Type: dev
    function draw_point( origin, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 0, 1 );
        }
        
        sphere( origin, 16, color, 0.25, 0, 16, 1 );
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x2344c906, Offset: 0x3798
    // Size: 0xa0, Type: dev
    function point_get( player )
    {
        for ( ;; )
        {
            waitframe( 1 );
            origin = get_lookat_origin( player );
            
            if ( player buttonpressed( "<dev string:x4ca>" ) )
            {
                return origin;
            }
            else if ( player buttonpressed( "<dev string:x4d6>" ) )
            {
                return undefined;
            }
            
            draw_point( origin, ( 1, 0, 1 ) );
        }
    }

    // Namespace dev/dev_shared
    // Params 0, eflags: 0x0
    // Checksum 0x9ed51ff9, Offset: 0x3840
    // Size: 0xf8, Type: dev
    function dev_get_point_pair()
    {
        player = util::gethostplayer();
        start = undefined;
        points = [];
        
        while ( !isdefined( start ) )
        {
            start = point_get( player );
            
            if ( !isdefined( start ) )
            {
                return points;
            }
        }
        
        while ( player buttonpressed( "<dev string:x4ca>" ) )
        {
            waitframe( 1 );
        }
        
        end = undefined;
        
        while ( !isdefined( end ) )
        {
            end = point_get( player );
            
            if ( !isdefined( end ) )
            {
                return points;
            }
        }
        
        points[ 0 ] = start;
        points[ 1 ] = end;
        return points;
    }

    // Namespace dev/dev_shared
    // Params 7, eflags: 0x0
    // Checksum 0xb97c5fc6, Offset: 0x3940
    // Size: 0xc6, Type: dev
    function function_adde34ed( var_b008e583, var_d7016d06, a, b, c, radius, spacing )
    {
        return { #start_origin:var_b008e583, #start_angle:var_d7016d06, #angle:0, #a:a, #b:b, #c:c, #radius:radius, #spacing:spacing };
    }

    // Namespace dev/dev_shared
    // Params 2, eflags: 0x0
    // Checksum 0x7aee9c61, Offset: 0x3a10
    // Size: 0x104, Type: dev
    function function_a4ccb933( var_b008e583, var_d7016d06 )
    {
        radius = 100;
        spacing = getdvarint( #"hash_71c117351507b9e5", 75 );
        a = getdvarint( #"hash_3c42741c0efba07", 14 );
        b = getdvarint( #"hash_3c42841c0efbbba", 35 );
        c = getdvarfloat( #"hash_3c42941c0efbd6d", 1 );
        return function_adde34ed( var_b008e583, var_d7016d06, a, b, c, radius, spacing );
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x37c1f612, Offset: 0x3b20
    // Size: 0x92, Type: dev
    function function_df0b6f84( spiral )
    {
        degrees = spiral.spacing * 360 / 6.28319 * spiral.radius;
        spiral.angle += degrees;
        spiral.radius = math::function_b1820790( spiral.a, spiral.b, spiral.c, spiral.angle );
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0xfa9456b7, Offset: 0x3bc0
    // Size: 0x66, Type: dev
    function function_7de15c85( spiral )
    {
        var_17e94d83 = rotatepointaroundaxis( ( spiral.radius, 0, 0 ), ( 0, 0, 1 ), spiral.angle + spiral.start_angle );
        return var_17e94d83 + spiral.start_origin;
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf37ecb2d, Offset: 0x3c30
    // Size: 0x70, Type: dev
    function function_98c05766( spiral )
    {
        spawn_point = function_7de15c85( spiral );
        trace = bullettrace( spawn_point + ( 0, 0, 100 ), spawn_point, 0, self );
        return trace[ #"position" ];
    }

    // Namespace dev/dev_shared
    // Params 1, eflags: 0x0
    // Checksum 0x6dc37585, Offset: 0x3ca8
    // Size: 0x26, Type: dev
    function function_4783f10c( spiral )
    {
        return spiral.angle + spiral.start_angle;
    }

#/
