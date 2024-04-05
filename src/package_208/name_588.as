package package_208
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_569;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_584;
   import alternativa.tanks.models.user.name_65;
   import flash.events.Event;
   import package_193.name_583;
   import package_209.ClansListEvent;
   import package_209.name_1916;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_588 extends name_576
   {
      
      public static var clanUserService:name_65;
      
      public static var localeService:name_102;
       
      
      private var var_1242:name_584;
      
      public function name_588(param1:int)
      {
         this.var_1258 = param1;
         var _loc2_:name_569 = name_569(clanUserService.userObject.name_176(name_569));
         this.var_1242 = new name_584(_loc2_,localeService.getText(name_390.const_1358),localeService.getText(name_390.const_632),localeService.getText(name_390.const_1059),"");
         super();
         var _loc3_:name_583 = clanUserService.userObject.name_176(name_583) as name_583;
         var_1256.method_1463(_loc3_.getOutgoingClans(),name_1916.OUTGOING);
         ClansListEvent.name_1886().addEventListener(ClansListEvent.OUTGOING + ClansListEvent.ADD,method_1498);
         ClansListEvent.name_1886().addEventListener(ClansListEvent.OUTGOING + ClansListEvent.REMOVE,method_1499);
         addChild(this.var_1242);
      }
      
      override protected function onResize(param1:Event = null) : void
      {
         var_1257 = this.var_1242.height;
         super.onResize(param1);
         this.var_1242.width = width - 3 * 11 - var_1258;
         this.var_1242.x = 11;
         this.var_1242.y = height - this.var_1242.height - 11;
      }
      
      override protected function method_1476() : void
      {
         super.method_1476();
         ClansListEvent.name_1886().removeEventListener(ClansListEvent.OUTGOING + ClansListEvent.ADD,method_1498);
         ClansListEvent.name_1886().removeEventListener(ClansListEvent.OUTGOING + ClansListEvent.REMOVE,method_1499);
      }
      
      override public function destroy() : void
      {
         this.var_1242.hide();
         super.destroy();
      }
   }
}
