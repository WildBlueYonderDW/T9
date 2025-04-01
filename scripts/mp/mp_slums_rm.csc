#using scripts\core_common\callbacks_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\util_shared;

#namespace mp_slums_rm;

// Namespace mp_slums_rm/level_init
// Params 1, eflags: 0x20
// Checksum 0x7531c97c, Offset: 0x130
// Size: 0x144
function event_handler[level_init] main( *eventstruct )
{
    setsaveddvar( #"enable_global_wind", 1 );
    setsaveddvar( #"wind_global_vector", "88 0 0" );
    setsaveddvar( #"wind_global_low_altitude", 0 );
    setsaveddvar( #"wind_global_hi_altitude", 10000 );
    setsaveddvar( #"wind_global_low_strength_percent", 100 );
    callback::on_gameplay_started( &on_gameplay_started );
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient( 0 );
}

// Namespace mp_slums_rm/mp_slums_rm
// Params 1, eflags: 0x0
// Checksum 0x15a64be7, Offset: 0x280
// Size: 0x2c
function on_gameplay_started( *localclientnum )
{
    waitframe( 1 );
    util::function_8eb5d4b0( 500, 1.5 );
}

// Namespace mp_slums_rm/mp_slums_rm
// Params 2, eflags: 0x0
// Checksum 0x53f4ac12, Offset: 0x2b8
// Size: 0xf2
function dom_flag_base_fx_override( flag, team )
{
    switch ( flag.name )
    {
        case #"a":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
        case #"b":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
        case #"c":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
    }
}

// Namespace mp_slums_rm/mp_slums_rm
// Params 2, eflags: 0x0
// Checksum 0xa6dfe245, Offset: 0x3b8
// Size: 0xf2
function dom_flag_cap_fx_override( flag, team )
{
    switch ( flag.name )
    {
        case #"a":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
        case #"b":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
        case #"c":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
    }
}

