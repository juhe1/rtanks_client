package alternativa.tanks.utils
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.engine3d.name_1773;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import package_37.Vector3;
   
   public class GraphicsUtils
   {
      
      private static var var_1876:Dictionary = new Dictionary(true);
       
      
      public function GraphicsUtils()
      {
         super();
      }
      
      public static function method_2043(param1:Object3D, param2:Vector3, param3:Vector3) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
         param1.rotationX = param3.x;
         param1.rotationY = param3.y;
         param1.rotationZ = param3.z;
      }
      
      public static function name_1073(param1:TextureMaterialRegistry, param2:BitmapData, param3:int, param4:int, param5:int = 0, param6:Boolean = true) : name_1072
      {
         var _loc7_:TextureMaterial = param1.getMaterial(null,param2,1);
         var _loc8_:Vector.<name_1773> = name_1779(param2,param3,param4,param5);
         return new name_1072(_loc7_,_loc8_);
      }
      
      public static function name_1818(param1:TextureMaterialRegistry, param2:BitmapData, param3:BitmapFilter, param4:int, param5:int, param6:int = 0, param7:Boolean = true) : name_1072
      {
         var _loc8_:BitmapData = name_1786(param2,param3);
         var _loc9_:TextureMaterial = param1.getMaterial(null,_loc8_,1);
         var _loc10_:Vector.<name_1773> = name_1779(param2,param4,param5,param6);
         return new name_1072(_loc9_,_loc10_);
      }
      
      public static function name_1786(param1:BitmapData, param2:BitmapFilter) : BitmapData
      {
         var _loc3_:* = undefined;
         var _loc4_:BitmapData = null;
         var _loc5_:Object = null;
         for(_loc3_ in var_1876)
         {
            _loc5_ = var_1876[_loc3_];
            if(_loc5_.s == param1 && _loc5_.f == param2)
            {
               return _loc3_;
            }
         }
         _loc4_ = param1.clone();
         _loc4_.applyFilter(param1,param1.rect,new Point(),param2);
         var_1876[_loc4_] = {
            "s":param1,
            "f":param2
         };
         return _loc4_;
      }
      
      public static function method_2042(param1:BitmapData, param2:int = 0) : Vector.<name_1773>
      {
         var _loc3_:int = param1.height;
         return name_1779(param1,_loc3_,_loc3_,param2);
      }
      
      public static function name_1779(param1:BitmapData, param2:int, param3:int, param4:int = 0) : Vector.<name_1773>
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = param1.width;
         var _loc11_:int = Math.min(param2,_loc10_);
         var _loc12_:int = _loc10_ / _loc11_;
         var _loc13_:int = param1.height;
         var _loc14_:int = Math.min(param3,_loc13_);
         var _loc15_:int = _loc13_ / _loc14_;
         var _loc16_:int = _loc12_ * _loc15_;
         var _loc17_:int = 0;
         if(param4 > 0)
         {
            if(param4 < _loc16_)
            {
               _loc16_ = param4;
            }
         }
         var _loc18_:Vector.<name_1773> = new Vector.<name_1773>(_loc16_);
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         while(_loc20_ < _loc15_)
         {
            _loc5_ = _loc20_ * _loc14_;
            _loc6_ = _loc5_ + _loc14_;
            _loc7_ = 0;
            while(_loc7_ < _loc12_)
            {
               _loc8_ = _loc7_ * _loc11_;
               _loc9_ = _loc8_ + _loc11_;
               var _loc21_:* = _loc17_++;
               _loc18_[_loc21_] = new name_1773(_loc8_ / _loc10_,_loc5_ / _loc13_,_loc9_ / _loc10_,_loc6_ / _loc13_);
               if(++_loc19_ == _loc16_)
               {
                  return _loc18_;
               }
               _loc7_++;
            }
            _loc20_++;
         }
         return _loc18_;
      }
   }
}
