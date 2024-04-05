package package_215
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_138;
   import base.class_122;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import package_13.Long;
   import package_228.ClanAction;
   import package_25.name_52;
   import package_28.name_57;
   import package_29.name_64;
   
   public class DeleteIndicator extends class_122 implements class_138
   {
      
      public static var clanUserInfoService:name_52;
      
      public static var clanMembersData:name_64;
      
      public static var foreignClanService:name_57;
      
      private static var var_1218:Class = name_1913;
      
      private static var var_1217:BitmapData = Bitmap(new var_1218()).bitmapData;
       
      
      private var invisible:Boolean;
      
      private var userId:Long;
      
      private var currentUserId:Long;
      
      public function DeleteIndicator(param1:Boolean = false, param2:Long = null, param3:Long = null)
      {
         super();
         this.userId = param2;
         this.currentUserId = param3;
         this.tabChildren = false;
         this.tabEnabled = false;
         this.useHandCursor = true;
         this.buttonMode = true;
         this.invisible = param1;
         var _loc4_:Bitmap = new Bitmap(var_1217);
         addChild(_loc4_);
      }
      
      public function method_1459() : void
      {
         visible = !this.invisible && Boolean(clanUserInfoService.method_375(ClanAction.REMOVE_FROM_CLAN)) && this.method_1460() && !foreignClanService.method_343();
      }
      
      private function method_1460() : Boolean
      {
         if(this.userId == null || this.currentUserId == null)
         {
            return true;
         }
         return clanMembersData.method_363(this.currentUserId).value < clanMembersData.method_363(this.userId).value;
      }
   }
}
