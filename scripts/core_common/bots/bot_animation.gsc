// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;

#namespace bot_animation;

// Namespace bot_animation/bot_animation
// Params 1, eflags: 0x2 linked
// Checksum 0xae2fbafa, Offset: 0xb0
// Size: 0x11c
function play_animation(var_f6550bae) {
    if (!self function_4a2ac86a()) {
        return;
    }
    var_4d704690 = self astsearch(var_f6550bae);
    if (!isdefined(var_4d704690[#"animation"])) {
        return;
    }
    animation = self animmappingsearch(var_4d704690[#"animation"]);
    self animscripted("bot_play_animation", self.origin, self.angles, animation, "server script", undefined, undefined, var_4d704690[#"blend_in_time"], undefined, undefined, 1);
    self thread function_33f98f4(animation, var_4d704690[#"animation_mocomp"], var_4d704690[#"blend_out_time"]);
}

// Namespace bot_animation/bot_animation
// Params 3, eflags: 0x6 linked
// Checksum 0x72a14811, Offset: 0x1d8
// Size: 0x1dc
function private function_33f98f4(animation, mocomp, blendout) {
    self endon(#"death", #"disconnect");
    var_278cadb0 = spawnstruct();
    var_278cadb0.name = mocomp;
    var_278cadb0.entity.var_278cadb0 = self;
    var_278cadb0.delta_anim = animation;
    var_278cadb0.blend_out_time = blendout;
    var_278cadb0.duration.var_278cadb0 = max(0, getanimlength(animation) - blendout);
    var_278cadb0.status.var_278cadb0 = 0;
    animationstatenetwork::runanimationmocomp(var_278cadb0);
    animlength = getanimlength(animation);
    animtime = self getanimtime(animation) * animlength;
    while (self isplayinganimscripted() && animtime < var_278cadb0.duration) {
        animtime = self getanimtime(animation) * animlength;
        var_278cadb0.status.var_278cadb0 = 1;
        animationstatenetwork::runanimationmocomp(var_278cadb0);
        waitframe(1);
    }
    var_278cadb0.status.var_278cadb0 = 2;
    animationstatenetwork::runanimationmocomp(var_278cadb0);
    self stopanimscripted(blendout);
}

