package alternativa.tanks.display
{
   import alternativa.tanks.sfx.name_2384;
   import package_49.name_163;
   
   public class name_3508
   {
      
      public static const const_2882:int = 3000;
      
      public static const const_2880:int = 100000;
      
      public static const const_1925:int = 300;
      
      public static const const_2881:int = 20;
      
      public static const const_1923:int = 30;
      
      public static const const_2883:int = 0;
      
      public static const name_3509:Number = 0.2;
      
      public static const MAX_VALUE:Number = 1;
      
      public static const const_2879:Number = 10;
       
      
      public function name_3508()
      {
         super();
      }
      
      public static function name_3511(param1:int) : name_2384
      {
         var _loc2_:int = 0;
         var _loc3_:int = name_3508.const_1925;
         var _loc4_:int = name_3508.const_2881;
         var _loc5_:Number = name_3508.name_3509;
         var _loc6_:Number = name_3508.MAX_VALUE;
         var _loc7_:Number = name_3508.const_2879;
         if(param1 == name_163.name_196)
         {
            _loc2_ = name_3508.const_2883;
         }
         else
         {
            _loc2_ = name_3508.const_1923;
         }
         return new name_2384(_loc3_,_loc4_,_loc2_,_loc5_,_loc6_,_loc7_);
      }
      
      public static function name_3510(param1:int) : int
      {
         if(param1 == name_163.name_196)
         {
            return name_3508.const_2880;
         }
         return name_3508.const_2882;
      }
   }
}
