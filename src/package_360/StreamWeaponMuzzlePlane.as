package package_360
{
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.engine3d.name_1773;
   import alternativa.tanks.sfx.SimplePlane;
   
   internal class StreamWeaponMuzzlePlane extends SimplePlane
   {
       
      
      private var var_2284:Vector.<name_1773>;
      
      private var numFrames:int;
      
      private var name_2698:Number;
      
      public function StreamWeaponMuzzlePlane()
      {
         super(1,1,0.5,0);
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(param1:name_1072) : void
      {
         setMaterialToAllFaces(param1.material);
         this.var_2284 = param1.name_1811;
         this.numFrames = this.var_2284.length;
         this.name_2698 = 0;
         this.method_2317(this.var_2284[0]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.var_2284 = null;
         this.numFrames = 0;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         this.name_2698 += param1 * param2;
         if(this.name_2698 >= this.numFrames)
         {
            this.name_2698 = 0;
         }
         this.method_2317(this.var_2284[int(this.name_2698)]);
      }
      
      private function method_2317(param1:name_1773) : void
      {
         a.u = param1.topLeftU;
         a.v = param1.topLeftV;
         b.u = param1.topLeftU;
         b.v = param1.bottomRightV;
         c.u = param1.bottomRightU;
         c.v = param1.bottomRightV;
         d.u = param1.bottomRightU;
         d.v = param1.topLeftV;
      }
   }
}
