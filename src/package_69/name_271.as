package package_69
{
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.models.battlefield.name_83;
   import package_53.name_94;
   
   public class name_271 implements name_211
   {
      
      public static var battleSerivce:name_83;
      
      public static var loaderWindowService:name_13;
      
      public static var lobbyLayoutService:name_94;
       
      
      private var var_687:Boolean;
      
      private var var_688:Boolean;
      
      public function name_271()
      {
         super();
      }
      
      public function reset() : void
      {
         lobbyLayoutService.method_743(false);
         this.var_687 = false;
         this.var_688 = false;
      }
      
      public function name_780() : void
      {
         if(!this.var_687)
         {
            this.var_687 = true;
            this.method_959();
         }
      }
      
      public function name_228() : void
      {
         if(!this.var_688)
         {
            this.var_688 = true;
            this.method_959();
         }
      }
      
      public function method_652() : Boolean
      {
         return this.var_687 && this.var_688;
      }
      
      public function method_651() : Boolean
      {
         return this.var_687;
      }
      
      private function method_959() : void
      {
         if(this.method_652())
         {
            lobbyLayoutService.method_743(true);
            loaderWindowService.hide();
            battleSerivce.method_153();
         }
      }
   }
}
