package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.Dictionary;
   
   public class AmbientShadows
   {
      
      private static const const_1806:Number = 7000;
      
      private static const const_1807:Number = 4000;
      
      private static const const_1804:Number = 2000;
      
      private static const const_1805:Number = 1000;
      
      private static const const_1803:Number = 0.01;
      
      private static const const_1724:Number = 60;
      
      private static const const_1808:Number = 20;
       
      
      private var camera:Camera3D;
      
      private const shadows:Dictionary = new Dictionary();
      
      private var nearDistance:Number = 4000;
      
      private var farDistance:Number = 7000;
      
      private var enabled:Boolean;
      
      private var color:int;
      
      private var alpha:Number = 0.85;
      
      public function AmbientShadows(param1:Camera3D)
      {
         super();
         this.camera = param1;
      }
      
      public function name_1230(param1:int) : void
      {
         this.color = param1;
      }
      
      public function add(param1:Shadow) : void
      {
         param1.color = this.color;
         param1.alpha = this.alpha;
         param1.nearDistance = this.nearDistance;
         param1.farDistance = this.farDistance;
         this.shadows[param1] = true;
         if(this.enabled)
         {
            this.camera.addShadow(param1);
         }
      }
      
      public function remove(param1:Shadow) : void
      {
         delete this.shadows[param1];
         if(this.enabled)
         {
            this.camera.removeShadow(param1);
         }
      }
      
      public function enable() : void
      {
         var _loc1_:* = undefined;
         if(!this.enabled)
         {
            this.enabled = true;
            for(_loc1_ in this.shadows)
            {
               this.camera.addShadow(_loc1_);
            }
         }
      }
      
      public function disable() : void
      {
         var _loc1_:* = undefined;
         if(this.enabled)
         {
            this.enabled = false;
            for(_loc1_ in this.shadows)
            {
               this.camera.removeShadow(_loc1_);
            }
         }
      }
      
      public function name_1233(param1:Number) : void
      {
         this.method_2186(param1);
         this.method_2187();
      }
      
      private function method_2186(param1:Number) : void
      {
         var _loc2_:Number = MathUtils.method_218((param1 - 20) / (60 - 20),0,1);
         var _loc3_:Number = 1000 + _loc2_ * (4000 - 1000);
         this.nearDistance += (_loc3_ - this.nearDistance) * 0.01;
         var _loc4_:Number = 2000 + _loc2_ * (7000 - 2000);
         this.farDistance += (_loc4_ - this.farDistance) * 0.01;
      }
      
      private function method_2187() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.shadows)
         {
            _loc1_.nearDistance = this.nearDistance;
            _loc1_.farDistance = this.farDistance;
         }
      }
   }
}
