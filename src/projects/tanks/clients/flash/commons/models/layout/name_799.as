package projects.tanks.clients.flash.commons.models.layout
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class name_799 implements name_790
   {
       
      
      private var object:name_70;
      
      private var impl:name_790;
      
      public function name_799(param1:name_70, param2:name_790)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function showGarage() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showGarage();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showBattleSelect() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showBattleSelect();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showMatchmaking() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showMatchmaking();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showBattleLobby() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showBattleLobby();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function showClan() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showClan();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function exitFromBattle() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.exitFromBattle();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         var state:LayoutState = param1;
         try
         {
            Model.object = this.object;
            this.impl.exitFromBattleToState(state);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function returnToBattle() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.returnToBattle();
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
