package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MaterialSequence
   {
      
      private static const const_1833:int = 65535;
      
      private static const const_1832:int = 16711680;
      
      private static const const_1830:int = 1 << 24;
      
      private static const const_1831:int = 1 << 25;
      
      private static const rect:Rectangle = new Rectangle();
      
      private static const point:Point = new Point();
      
      private static var matrix:Matrix = new Matrix(-1,0,0,1);
       
      
      public var materials:Vector.<Material>;
      
      internal var name_2318:int;
      
      public var var_2135:BitmapData;
      
      private var registry:name_968;
      
      private var var_2134:int;
      
      public function MaterialSequence(param1:name_968, param2:BitmapData, param3:int, param4:Boolean, param5:Boolean, param6:Boolean, param7:Number)
      {
         super();
         this.registry = param1;
         this.var_2135 = param2;
         this.var_2134 = param3;
         if(param4)
         {
            this.var_2134 |= const_1831;
         }
         if(param5)
         {
            this.var_2134 |= const_1830;
         }
         var _loc8_:int = param2.width / param3;
         if(param4)
         {
            _loc8_ *= 2;
         }
         this.materials = new Vector.<Material>(_loc8_,true);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            this.materials[_loc9_] = new name_2491(null,true,true,param6 ? 1 : 0,param7);
            _loc9_++;
         }
         name_2491(this.materials[0]).texture = this.method_2224(0);
      }
      
      public function get frameWidth() : int
      {
         return this.var_2134 & 65535;
      }
      
      public function get mipMapResolution() : Number
      {
         if(this.materials != null)
         {
            return TextureMaterial(this.materials[0]).resolution;
         }
         return 1;
      }
      
      public function set mipMapResolution(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(this.materials != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.materials.length)
            {
               TextureMaterial(this.materials[_loc2_]).resolution = param1;
               _loc2_++;
            }
         }
      }
      
      public function release() : void
      {
         if(this.name_2318 > 0)
         {
            --this.name_2318;
            if(this.name_2318 == 0 && this.registry != null)
            {
               this.registry.method_1921(this);
            }
         }
      }
      
      internal function dispose() : void
      {
         var _loc2_:name_2491 = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.materials.length)
         {
            _loc2_ = this.materials[_loc1_] as name_2491;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            _loc2_ = null;
            _loc1_++;
         }
         this.method_2225();
         this.materials = null;
         this.registry = null;
         this.name_2318 = 0;
      }
      
      internal function tick() : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:name_2491 = null;
         var _loc1_:int = (this.var_2134 & 16711680) >> 16;
         var _loc2_:name_2491 = name_2491(this.materials[_loc1_]);
         _loc1_++;
         this.var_2134 = this.var_2134 & ~16711680 | _loc1_ << 16;
         if(_loc1_ == this.materials.length)
         {
            this.method_2225();
            return true;
         }
         _loc2_ = name_2491(this.materials[_loc1_]);
         _loc3_ = (this.var_2134 & const_1831) > 0;
         if(_loc3_)
         {
            if((_loc1_ & 1) == 1)
            {
               _loc4_ = name_2491(this.materials[_loc1_ - 1]);
               _loc2_.texture = this.method_2226(_loc4_.texture);
            }
            else
            {
               _loc2_.texture = this.method_2224(_loc1_ >> 1);
            }
         }
         else
         {
            _loc2_.texture = this.method_2224(_loc1_);
         }
         return false;
      }
      
      private function method_2225() : void
      {
         if((this.var_2134 & const_1830) > 0)
         {
            this.var_2135.dispose();
            this.var_2134 &= ~const_1830;
         }
      }
      
      private function method_2224(param1:int) : BitmapData
      {
         var _loc2_:int = this.var_2134 & 65535;
         var _loc3_:BitmapData = new BitmapData(_loc2_,this.var_2135.height,this.var_2135.transparent,0);
         rect.x = param1 * _loc2_;
         rect.width = _loc2_;
         rect.height = this.var_2135.height;
         _loc3_.copyPixels(this.var_2135,rect,point);
         return _loc3_;
      }
      
      private function method_2226(param1:BitmapData) : BitmapData
      {
         var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,0);
         matrix.tx = param1.width;
         _loc2_.draw(param1,matrix);
         return _loc2_;
      }
   }
}
