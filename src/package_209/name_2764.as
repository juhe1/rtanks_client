package package_209
{
   import alternativa.tanks.models.user.name_580;
   import flash.events.MouseEvent;
   import package_13.Long;
   import platform.client.fp10.core.type.name_70;
   
   public class name_2764 extends ClanInfoLabel
   {
       
      
      public function name_2764(param1:Long)
      {
         super(param1);
      }
      
      override protected function method_1552(param1:MouseEvent) : void
      {
         var_1324.visible = false;
         var _loc2_:name_70 = clanUserService.method_355(clanId);
         (clanUserService.userObject.name_176(name_580) as name_580).method_1413(_loc2_);
      }
      
      override public function method_1551() : void
      {
         super.method_1551();
      }
   }
}
