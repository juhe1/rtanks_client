package alternativa.tanks.model.friends.invite
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.BattleSelectModel;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_122.name_337;
   import package_13.Long;
   import package_175.name_539;
   import package_54.name_102;
   import package_60.TextConst;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.battleselect.name_386;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class BattleInviteModel
   {
       
      
      private var var_1773:Sound;
      
      private var var_382:name_539;
      
      private var localeService:name_102;
      
      private var var_1772:Dictionary;
      
      private var var_1771:String;
      
      public function BattleInviteModel()
      {
         super();
         this.var_382 = Main.osgi.getService(name_539) as name_539;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         this.var_1772 = new Dictionary();
         var _loc1_:SoundResource = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,106777)));
         if(_loc1_ != null && _loc1_.isLoaded)
         {
            this.var_1773 = _loc1_.sound;
         }
      }
      
      private function method_1953(param1:String) : void
      {
         var _loc2_:String = String(this.localeService.getText(TextConst.const_338));
         if(!this.var_382.method_1308(param1,_loc2_))
         {
            this.var_382.addNotification(new name_1027(param1,_loc2_));
         }
      }
      
      private function method_110(param1:name_337) : String
      {
         var _loc2_:String = this.localeService.getText(TextConst.const_155) + "\n";
         if(param1.availableRank)
         {
            if(param1.availableSlot)
            {
               _loc2_ += "\n" + this.localeService.getText(TextConst.const_194);
            }
            else
            {
               _loc2_ += "\n" + this.method_98(this.localeService.getText(TextConst.const_294));
            }
         }
         else
         {
            _loc2_ += "\n" + this.method_98(this.localeService.getText(TextConst.const_299));
         }
         return _loc2_;
      }
      
      private function method_1954(param1:name_337) : String
      {
         var _loc2_:String = param1.serverNumber + " " + this.localeService.getText(TextConst.const_214);
         if(this.localeService.language == "en" || this.localeService.language == "de")
         {
            _loc2_ = this.localeService.getText(TextConst.const_214) + " " + param1.serverNumber;
         }
         return param1.mapName + " (" + _loc2_ + ")";
      }
      
      private function method_98(param1:String) : String
      {
         return "<font color=\'#" + "b1b1b1" + "\'>" + param1 + "</font>";
      }
      
      public function onBattleInvite(param1:String) : void
      {
         this.var_1771 = param1;
         if(this.var_1771 in this.var_1772)
         {
            this.method_1953(this.var_1771);
         }
         else
         {
            this.method_1952();
         }
      }
      
      private function method_1952() : void
      {
         this.var_1772[this.var_1771] = true;
         var _loc1_:String = Main.osgi.getService(name_386) != null ? BattleSelectModel(Main.osgi.getService(name_386)).selectedBattleId : "null";
         Network(Main.osgi.getService(name_2)).send("lobby;invite_to_battle;" + this.var_1771 + ";" + _loc1_);
         this.var_1771 = null;
      }
      
      public function name_1058(param1:String, param2:name_337) : void
      {
         this.var_382.addNotification(new BattleInviteNotification(param1,this.method_110(param2),0,param2.battleId,param2.remote,this.method_1954(param2),param2.noSuppliesBattle));
         if(this.var_1773 != null)
         {
            this.var_1773.play();
         }
      }
      
      public function name_1052(param1:String) : void
      {
         this.name_1067(param1);
         this.var_382.addNotification(new name_1027(param1,this.localeService.getText(TextConst.const_156)));
      }
      
      public function name_1067(param1:String) : void
      {
         delete this.var_1772[param1];
      }
      
      public function name_1050(param1:String) : void
      {
         this.name_1067(param1);
         this.var_382.addNotification(new name_1027(param1,this.localeService.getText(TextConst.BATTLE_INVITE_REFUSED_TO_JOIN_THE_BATTLE_AT_YOUR_INVITATION_LABEL)));
      }
   }
}
