package alternativa.tanks.display
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import flash.display.Shape;
   
   use namespace alternativa3d;
   
   public class AxisIndicator extends Shape
   {
       
      
      private var _size:int;
      
      private var axis1:Vector.<Number>;
      
      public function AxisIndicator(param1:int)
      {
         this.axis1 = Vector.<Number>([0,0,0,0,0,0]);
         super();
         this._size = param1;
      }
      
      public function update(param1:Camera3D) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         graphics.clear();
         param1.alternativa3d::composeMatrix();
         this.axis1[0] = param1.alternativa3d::ma;
         this.axis1[1] = param1.alternativa3d::mb;
         this.axis1[2] = param1.alternativa3d::me;
         this.axis1[3] = param1.alternativa3d::mf;
         this.axis1[4] = param1.alternativa3d::mi;
         this.axis1[5] = param1.alternativa3d::mj;
         var _loc2_:int = 0;
         var _loc3_:int = 16;
         while(_loc2_ < 6)
         {
            _loc4_ = this.axis1[_loc2_] + 1;
            _loc5_ = this.axis1[int(_loc2_ + 1)] + 1;
            graphics.lineStyle(0,255 << _loc3_);
            graphics.moveTo(this._size,this._size);
            graphics.lineTo(this._size * _loc4_,this._size * _loc5_);
            _loc2_ += 2;
            _loc3_ -= 8;
         }
      }
      
      public function get size() : int
      {
         return this._size;
      }
   }
}
