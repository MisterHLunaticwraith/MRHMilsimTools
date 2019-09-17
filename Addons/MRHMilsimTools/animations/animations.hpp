//for tests / to Delete
//class cfgMovesBasic;
/*
class cfgMovesBasic;
class cfgMovesMaleSdr : cfgMovesBasic
{
   class Actions;
   class HandsOnCrutchFinger : Actions
   {
      file = "\MRHMilsimTools\fuckStatic.rtm";
      //interpolateTo[]={""};
      static = 1;
   };
};
*/
class CfgMovesBasic; // Reference CfgMovesBasic. This class is used by ArmA3 to store Actionsets, which will be covered at later time
class CfgMovesMaleSdr: CfgMovesBasic // Override CfgMovesMaleSdr class in which all animation states and gestures are stored. You can ﻿also make your own class but you ﻿n﻿eed to make sure your unit ﻿will be using ﻿it. . Usually lea﻿ve﻿ as﻿ is.
{
   skeletonName="OFP2_ManSkeleton"; // Skeleton indication. If you are doing animations for a T-rex, you will obviously use your custom skeleton for all moves. . Usually leave as is.
   gestures="CfgGesturesMale"; // Gestures class. Again, if you are using custom class, change it. Usually leave as is.
   class States
   {
      class AmovPercMstpSrasWrflDnon;
      class HandsOnCrutchFinger : AmovPercMstpSrasWrflDnon
      {
         looped = 0; // if set to 1, engine will copy first keyframe to last keyframe, resulting in more "looped" motion. for non looping movement, ALWAYS DISABLE
         speed = 1; // if speed is entered as positive number, it will mean it will last for 1/speed seconds (if 0.25, it will last for 4s). You can use negative number to indicate how many seconds should it last, in this example -5 will make it last 5 seconds
         file = "\MRHMilsimTools\animations\fuckStatic.rtm"; // path to animation file. may or may not end with ".rtm", there is no difference
         canBlendStep = 0; // sliding effect on/off, we set it to off because we do not want character to move/slide in this move
         rightHandIKCurve[] = {0};
         leftHandIKCurve[] = {0};
         minPlayTime= 0.95; // the ratio of animation that is required to play, in this example: 95% of animation must be played before it can be interrupted 
   // Interpolation - smooth blending to another state. We use it usually when we know that last keyframe is different to first keyframe of the target animation. If they are the same, use ConnectTo[] instead.
            InterpolateTo[] = 
               {
                  "AmovPercMstpSrasWrflDnon", 0.5  
      // First string is the class name of target animation, in this example this is default rifle standing pose. The number that follows is animation cost -> the engine will always look for the next target animation with smallest cost if there is more than one chain leading towards called action [again, actions will be explained later]
      // You can ignore the number (enter any float you want from 0 to 1) if: 
      /// there is only one way leading to target action
      /// there is no animation chain involved
               };
      };
   };
};    