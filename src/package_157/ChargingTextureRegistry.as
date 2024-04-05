package package_157
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class ChargingTextureRegistry
   {
      
      private static const const_2036:int = 210;
      
      private static const const_1726:int = 30;
       
      
      private const cache:Object = {};
      
      public function ChargingTextureRegistry()
      {
         super();
      }
      
      private static function method_2507(param1:ImageResource, param2:ImageResource, param3:ImageResource) : String
      {
         return param1.id.toString() + "_" + param2.id.toString() + "_" + param3.id.toString();
      }
      
      private static function createTexture(param1:ImageResource, param2:ImageResource, param3:ImageResource) : BitmapData
      {
         var _loc4_:BitmapData = param1.data;
         var _loc5_:BitmapData = param2.data;
         var _loc6_:BitmapData = param3.data;
         var _loc7_:BitmapData = new BitmapData(210 * 30,210,true,0);
         var _loc8_:String = BlendMode.NORMAL;
         var _loc9_:int = 0;
         while(_loc9_ < 30)
         {
            drawPart1(_loc4_,_loc7_,_loc9_,210,_loc8_);
            drawPart2(_loc5_,_loc7_,_loc9_,210,_loc8_);
            drawPart3(_loc6_,_loc7_,_loc9_,210,_loc8_);
            _loc9_++;
         }
         return _loc7_;
      }
      
      private static function drawPart1(param1:BitmapData, param2:BitmapData, param3:int, param4:int, param5:String) : void
      {
         var _loc6_:ColorTransform = new ColorTransform();
         if(param3 < 14)
         {
            _loc6_.alphaMultiplier = param3 / 14;
         }
         else if(param3 < 25)
         {
            _loc6_.alphaMultiplier = 1;
         }
         else
         {
            _loc6_.alphaMultiplier = 1 - (param3 - 24) / 5;
         }
         var _loc7_:Matrix = new Matrix();
         _loc7_.tx = param3 * param4 + 0.5 * (param4 - param1.width);
         _loc7_.ty = 0.5 * (param4 - param1.height);
         param2.draw(param1,_loc7_,_loc6_,param5,null,true);
      }
      
      private static function drawPart2(param1:BitmapData, param2:BitmapData, param3:int, param4:int, param5:String) : void
      {
         var _loc6_:ColorTransform = new ColorTransform();
         if(param3 < 5)
         {
            _loc6_.alphaMultiplier = param3 / 5;
         }
         else if(param3 < 25)
         {
            _loc6_.alphaMultiplier = 1;
         }
         else
         {
            _loc6_.alphaMultiplier = 1 - (param3 - 24) / 5;
         }
         var _loc7_:Matrix = new Matrix();
         _loc7_.translate(-0.5 * param1.width,-0.5 * param1.height);
         _loc7_.rotate(2 * param3 * Math.PI / 180);
         _loc7_.translate(param3 * param4 + 0.5 * param4,0.5 * param4);
         param2.draw(param1,_loc7_,_loc6_,param5,null,true);
      }
      
      private static function drawPart3(param1:BitmapData, param2:BitmapData, param3:int, param4:int, param5:String) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:ColorTransform = new ColorTransform();
         if(param3 < 24)
         {
            _loc6_ = param3 / 24;
            _loc8_.alphaMultiplier = _loc6_;
            _loc7_ = 0.4 + 0.6 * _loc6_;
         }
         else if(param3 < 25)
         {
            _loc8_.alphaMultiplier = 1;
            _loc7_ = 1;
         }
         else
         {
            _loc6_ = 1 - (param3 - 24) / 5;
            _loc8_.alphaMultiplier = _loc6_;
            _loc7_ = 0.2 + 0.8 * _loc6_;
         }
         var _loc9_:Matrix = new Matrix();
         _loc9_.translate(-0.5 * param1.width,-0.5 * param1.height);
         _loc9_.scale(_loc7_,_loc7_);
         _loc9_.rotate(2 * -param3 * Math.PI / 180);
         _loc9_.translate(param3 * param4 + 0.5 * param4,0.5 * param4);
         param2.draw(param1,_loc9_,_loc8_,param5,null,true);
      }
      
      public function method_670(param1:ImageResource, param2:ImageResource, param3:ImageResource) : BitmapData
      {
         var _loc4_:name_2714 = this.method_2041(param1,param2,param3);
         ++_loc4_.name_2318;
         return _loc4_.texture;
      }
      
      public function method_1919(param1:ImageResource, param2:ImageResource, param3:ImageResource) : void
      {
         var _loc4_:String = method_2507(param1,param2,param3);
         var _loc5_:name_2714 = this.cache[_loc4_];
         if(_loc5_ != null)
         {
            --_loc5_.name_2318;
            if(_loc5_.name_2318 == 0)
            {
               _loc5_.texture.dispose();
               delete this.cache[_loc4_];
            }
         }
      }
      
      private function method_2041(param1:ImageResource, param2:ImageResource, param3:ImageResource) : name_2714
      {
         var _loc4_:String = method_2507(param1,param2,param3);
         var _loc5_:name_2714 = this.cache[_loc4_];
         if(_loc5_ == null)
         {
            _loc5_ = new name_2714();
            _loc5_.texture = createTexture(param1,param2,param3);
            this.cache[_loc4_] = _loc5_;
         }
         return _loc5_;
      }
   }
}
