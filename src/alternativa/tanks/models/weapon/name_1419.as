package alternativa.tanks.models.weapon
{
   import alternativa.physics.name_888;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import package_1.Main;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   
   public class name_1419
   {
      
      public static var battleService:BattlefieldModel = Main.osgi.getService(IBattleField) as BattlefieldModel;
      
      private static const const_1889:Number = 6.5;
      
      private static const const_1888:Vector3 = new Vector3();
      
      private static const var_1723:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const name_1479:Number = Math.cos(Math.PI / 180);
      
      private static const const_1887:name_904 = new name_904(new Vector3(1,1,1),name_73.name_252,name_888.name_947);
       
      
      public function name_1419()
      {
         super();
      }
      
      public static function name_1423(param1:Vector3, param2:Vector3) : Boolean
      {
         method_2307(param1,param2);
         var _loc3_:TanksCollisionDetector = battleService.var_117.name_247;
         return _loc3_.method_710(const_1887);
      }
      
      private static function method_2307(param1:Vector3, param2:Vector3) : void
      {
         var_1723.diff(param1,param2);
         var_1723.y = var_1723.vLength() / 2;
         var_1723.x = 6.5;
         var_1723.z = 6.5;
         const_1887.hs.vCopy(var_1723);
         const_1888.sum(param1,param2);
         const_1888.vScale(0.5);
         var _loc3_:Matrix4 = const_1887.transform;
         _loc3_.method_1841();
         _loc3_.name_731(const_1888);
         direction.diff(param2,param1);
         direction.normalize();
         var _loc4_:Number = direction.dot(Vector3.Y_AXIS);
         if(Math.abs(direction.y) < name_1479)
         {
            axis.vCross2(Vector3.Y_AXIS,direction);
            axis.normalize();
            _loc3_.name_1097(axis,Math.acos(_loc4_));
         }
         const_1887.calculateAABB();
      }
   }
}
