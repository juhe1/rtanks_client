package projects.tanks.clients.flash.commons.models.layout
{
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class ILobbyLayoutEvents implements name_790
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_790>;
      
      public function ILobbyLayoutEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_790>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function showGarage() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showGarage();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showBattleSelect() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showBattleSelect();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showMatchmaking() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showMatchmaking();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showBattleLobby() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showBattleLobby();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showClan() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showClan();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function exitFromBattle() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.exitFromBattle();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         var i:int = 0;
         var m:name_790 = null;
         var state:LayoutState = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.exitFromBattleToState(state);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function returnToBattle() : void
      {
         var i:int = 0;
         var m:name_790 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.returnToBattle();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
