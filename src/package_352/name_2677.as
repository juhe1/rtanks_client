package package_352
{
   import alternativa.engine3d.objects.Sprite3D;
   import package_303.TextureByteData;
   
   public class name_2677 extends name_1682
   {
       
      
      public var var_523:TextureByteData;
      
      public var scale:Number;
      
      public function name_2677(param1:TextureByteData, param2:Number = 0.5, param3:Number = 0.5, param4:Number = 1)
      {
         super(PropObjectType.SPRITE);
         this.var_523 = param1;
         this.scale = param4;
         var _loc5_:Sprite3D = new Sprite3D(1,1);
         _loc5_.originX = param2;
         _loc5_.originY = param3;
         object = _loc5_;
      }
      
      override public function traceProp() : void
      {
         super.traceProp();
         trace("\ttextureData",this.var_523.diffuseData.bytesAvailable,this.var_523.opacityData);
      }
   }
}
