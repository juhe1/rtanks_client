package package_418
{
   import alternativa.engine3d.core.Vertex;
   import flash.geom.Point;
   
   public class CircleDynamicSkin extends CommonDynamicSkin
   {
       
      
      private var var_3084:Number;
      
      private var var_3085:Number;
      
      public function CircleDynamicSkin(param1:Number, param2:Number)
      {
         super();
         this.var_3084 = param1;
         this.var_3085 = param2;
      }
      
      override public function rotate(param1:Number) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         super.rotate(param1);
         var _loc6_:Number = Math.cos(rotation);
         var _loc7_:Number = -Math.sin(rotation);
         var _loc8_:int = 0;
         while(_loc8_ < vertices.length)
         {
            _loc2_ = vertices[_loc8_];
            _loc3_ = var_3081[_loc8_];
            _loc4_ = _loc3_.x - this.var_3084;
            _loc5_ = _loc3_.y - this.var_3085;
            _loc2_.u = _loc4_ * _loc6_ + _loc5_ * _loc7_ + this.var_3084;
            _loc2_.v = _loc4_ * _loc7_ - _loc5_ * _loc6_ + this.var_3085;
            _loc8_++;
         }
      }
   }
}
