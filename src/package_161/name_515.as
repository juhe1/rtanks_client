package package_161
{
   import alternativa.model.name_66;
   import package_364.class_87;
   import package_364.class_88;
   import package_4.ClientObject;
   
   public class name_515 extends class_88 implements class_87, name_1448
   {
       
      
      public function name_515()
      {
         super();
         var_365.push(name_66,class_87,name_1448);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:name_1743 = new name_1743();
         _loc5_.name_1746 = isNaN(param2) ? 0 : param2;
         _loc5_.name_1745 = isNaN(param4) ? 1 : param4;
         _loc5_.name_1744 = isNaN(param3) ? 0 : param3;
         _loc5_.name_1747 = _loc5_.name_1745 * 100 - _loc5_.name_1746 * 100;
         if(_loc5_.name_1744 > 100)
         {
            _loc5_.name_1744 = 100;
         }
         param1.method_12(name_515,_loc5_);
      }
      
      public function name_1458(param1:ClientObject, param2:Number) : Number
      {
         var _loc3_:name_1743 = param1.method_16(name_515) as name_1743;
         if(_loc3_.name_1747 <= 0)
         {
            return 1;
         }
         if(param2 <= _loc3_.name_1746 * 100)
         {
            return 1;
         }
         if(param2 >= _loc3_.name_1745 * 100)
         {
            return 0.01 * _loc3_.name_1744;
         }
         return 0.01 * (_loc3_.name_1744 + (_loc3_.name_1745 * 100 - param2) * (100 - _loc3_.name_1744) / _loc3_.name_1747);
      }
      
      public function method_1243(param1:ClientObject) : Number
      {
         var _loc2_:name_1743 = name_1743(param1.method_16(name_515));
         return _loc2_.name_1746 * 100;
      }
      
      public function method_1242(param1:ClientObject) : Number
      {
         var _loc2_:name_1743 = name_1743(param1.method_16(name_515));
         return _loc2_.name_1745;
      }
   }
}
