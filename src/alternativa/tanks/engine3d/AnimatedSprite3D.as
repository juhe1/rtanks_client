package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Sprite3D;
   
   public class AnimatedSprite3D extends Sprite3D
   {
       
      
      public var name_1432:Boolean;
      
      private var var_2284:Vector.<name_1773>;
      
      private var numFrames:int;
      
      private var fps:Number;
      
      public var var_1869:Number = 0;
      
      public function AnimatedSprite3D(param1:Number, param2:Number, param3:Material = null)
      {
         super(param1,param2,param3);
         useShadowMap = false;
         useLight = false;
         super.softAttenuation = 40;
      }
      
      public function name_1433(param1:name_1072) : void
      {
         material = param1.material;
         this.var_2284 = param1.name_1811;
         this.fps = param1.fps;
         this.numFrames = this.var_2284.length;
         this.var_1869 = 0;
         this.name_1431(this.var_1869);
      }
      
      public function method_2318() : Number
      {
         return this.fps;
      }
      
      public function name_2313() : int
      {
         return this.numFrames;
      }
      
      public function clear() : void
      {
         this.var_2284 = null;
         material = null;
         this.numFrames = 0;
      }
      
      public function name_1431(param1:int) : void
      {
         var _loc2_:int = param1 % this.numFrames;
         this.method_2317(this.var_2284[_loc2_]);
      }
      
      private function method_2317(param1:name_1773) : void
      {
         if(param1 == null)
         {
            return;
         }
         topLeftU = param1.topLeftU;
         topLeftV = param1.topLeftV;
         bottomRightU = param1.bottomRightU;
         bottomRightV = param1.bottomRightV;
      }
      
      public function update(param1:Number) : void
      {
         this.var_1869 += this.fps * param1;
         if(this.var_1869 >= this.numFrames)
         {
            if(this.name_1432)
            {
               this.var_1869 %= this.numFrames;
            }
            else
            {
               this.var_1869 = this.numFrames - 1;
            }
         }
         this.method_2317(this.var_2284[int(this.var_1869)]);
      }
   }
}
