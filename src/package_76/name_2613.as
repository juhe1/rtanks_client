package package_76
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import package_1.Main;
   import package_37.Vector3;
   
   public class name_2613
   {
      
      public static var battleService:BattlefieldModel;
       
      
      public var position:Vector3;
      
      public var name_2614:Vector3;
      
      public function name_2613()
      {
         this.position = new Vector3();
         this.name_2614 = new Vector3();
         battleService = BattlefieldModel(Main.osgi.name_6(name_83));
         super();
      }
      
      public function name_3183() : void
      {
         var _loc1_:name_735 = battleService.var_117.viewport.camera;
         this.position.x = _loc1_.x;
         this.position.y = _loc1_.y;
         this.position.z = _loc1_.z;
         this.name_2614.x = _loc1_.rotationX;
         this.name_2614.y = _loc1_.rotationY;
         this.name_2614.z = _loc1_.rotationZ;
      }
   }
}
