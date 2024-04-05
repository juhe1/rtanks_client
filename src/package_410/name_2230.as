package package_410
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import package_242.name_662;
   import package_312.name_1311;
   import package_47.BattleTeamType;
   
   public class name_2230
   {
      
      private static const const_2238:name_662 = new name_662("beam_width",100,0,1000);
      
      private static const const_2240:name_662 = new name_662("beam_ulength",500,0,10000);
      
      private static const const_2237:name_662 = new name_662("beam_anim_speed",-0.6,-1000,1000);
      
      private static const const_2241:name_662 = new name_662("beam_urange",0.6,0.1,1);
      
      private static const const_2239:name_662 = new name_662("beam_alpha",1,0,1);
       
      
      private var var_2870:name_2885;
      
      private var var_2869:name_2885;
      
      public function name_2230(param1:TextureMaterialRegistry, param2:name_1311)
      {
         super();
         this.var_2870 = method_2705(param1,param2.blueRay.data,param2.blueRayTip.data,50,100,1,1,1);
         this.var_2869 = method_2705(param1,param2.redRay.data,param2.redRayTip.data,50,100,1,1,1);
      }
      
      private static function method_2705(param1:TextureMaterialRegistry, param2:BitmapData, param3:BitmapData, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : name_2885
      {
         var _loc9_:TextureMaterial = null;
         _loc9_ = param1.getMaterial(null,param2,1);
         _loc9_.repeat = true;
         var _loc10_:TextureMaterial = param1.getMaterial(null,param3,1);
         return new name_2885(_loc9_,_loc10_,param4,param5,param6,param7,param8);
      }
      
      private static function method_2704(param1:name_2885) : name_2885
      {
         return new name_2885(param1.name_2889,param1.name_2886,const_2238.value,const_2240.value,const_2237.value,const_2241.value,const_2239.value);
      }
      
      private function method_2706() : name_2885
      {
         return method_2704(this.var_2870);
      }
      
      private function method_2707() : name_2885
      {
         return method_2704(this.var_2869);
      }
      
      public function name_2239(param1:BattleTeamType) : name_2885
      {
         return param1 == BattleTeamType.BLUE ? this.method_2706() : this.method_2707();
      }
   }
}
