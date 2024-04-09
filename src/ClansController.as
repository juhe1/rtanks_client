package
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.user.name_564;
   import alternativa.tanks.models.user.name_65;
   import package_102.Command;
   import package_102.Type;
   import package_13.Long;
   import package_20.Space;
   import package_25.name_52;
   import package_39.Model;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.registry.name_45;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.clans.user.name_614;
   import projects.tanks.client.clans.user.name_788;
   import scpacker.networking.class_6;
   
   public class ClansController implements class_6
   {
      
      public static var var_72:name_45 = OSGi.getInstance().getService(name_45) as name_45;
      
      public static var modelRegistry:name_29 = OSGi.getInstance().getService(name_29) as name_29;
       
      
      private var space:name_202;
      
      private var clanObject:name_70;
      
      public function ClansController()
      {
         super();
         this.space = new Space(Long.getLong(9253410,6243295),null,null,false);
         name_33(OSGi.getInstance().getService(name_33)).addSpace(this.space);
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(Long.getLong(259670316,1522052296));
         this.clanObject = this.space.name_15(Long.getLong(0,635839),var_72.createClass(Long.getLong(0,410352),_loc1_),"ClanObject");
      }
      
      public function onData(param1:Command) : void
      {
         var _loc2_:Vector.<Long> = null;
         var _loc3_:Object = null;
         var _loc4_:name_788 = null;
         var _loc5_:name_564 = null;
         switch(param1.type)
         {
            case Type.CLAN:
               if(param1.name_319[0] == "init")
               {
                  _loc3_ = JSON.parse(param1.name_319[1]);
                  _loc4_ = new name_788(_loc3_.clan,_loc3_.giveBonusesClan,_loc3_.loadingInServiceSpace,_loc3_.restrictionTimeJoinClanInSec,_loc3_.showBuyLicenseButton,_loc3_.showOtherClan);
                  name_52(OSGi.getInstance().getService(name_52)).clanMember = _loc3_.clanMember;
                  _loc2_ = new Vector.<Long>();
                  _loc2_.push(Long.getLong(259670316,1522052296));
                  _loc2_.push(Long.getLong(205268203,-139952058));
                  _loc2_.push(Long.getLong(1120804751,-1974844538));
                  _loc2_.push(Long.getLong(471234096,-1683897946));
                  name_65(OSGi.getInstance().getService(name_65)).userObject = this.space.name_15(Long.getLong(0,31835),var_72.createClass(Long.getLong(0,23845),_loc2_),"UserObject");
                  Model.object = this.clanObject;
                  modelRegistry.getModel(this.clanObject.gameClass.models[0]).method_18(_loc4_);
                  _loc5_ = name_564(modelRegistry.getModel(Long.getLong(1420566941,-260091189)));
                  name_141(_loc5_).objectLoadedPost();
                  break;
               }
               if(param1.name_319[0] == "showClan")
               {
                  _loc5_ = name_564(modelRegistry.getModel(Long.getLong(1420566941,-260091189)));
                  _loc5_.showWindow();
                  break;
               }
               if(param1.name_319[0] == "clanExist")
               {
                  name_614(modelRegistry.getModel(Long.getLong(259670316,1522052296))).clanExist();
                  break;
               }
               if(param1.name_319[0] == "clanNotExist")
               {
                  name_614(modelRegistry.getModel(Long.getLong(259670316,1522052296))).clanNotExist();
               }
               break;
         }
      }
   }
}
