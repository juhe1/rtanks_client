package package_382
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.challenge.ChallengeEvents;
   import alternativa.tanks.model.quest.challenge.name_547;
   import alternativa.tanks.model.quest.common.gui.window.name_1835;
   import alternativa.tanks.model.quest.common.name_551;
   import package_104.name_327;
   
   public class name_1836 extends name_1835 implements name_547
   {
       
      
      private var var_2544:ChallengesView;
      
      public function name_1836()
      {
         super();
      }
      
      public function method_1368(param1:Vector.<name_327>) : void
      {
         this.method_2517().name_2723(param1);
         if(name_551(OSGi.getInstance().name_6(name_551)).isWindowOpen())
         {
            this.method_2517().name_2724();
         }
      }
      
      public function method_1369(param1:int) : int
      {
         return this.method_2517().name_2722(param1);
      }
      
      override public function show() : void
      {
         this.method_2517().name_2725();
         addChild(this.method_2517());
         dispatchEvent(new ChallengeEvents(ChallengeEvents.REQUEST_DATA));
      }
      
      private function method_2517() : ChallengesView
      {
         if(this.var_2544 == null)
         {
            this.var_2544 = new ChallengesView();
         }
         return this.var_2544;
      }
      
      override public function hide() : void
      {
         super.hide();
         removeChild(this.method_2517());
         this.method_2517().clear();
      }
   }
}
