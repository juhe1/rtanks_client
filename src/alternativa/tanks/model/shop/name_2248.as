package alternativa.tanks.model.shop
{
   import package_1.Main;
   import package_125.SendPromoCodeEvent;
   import package_125.name_1576;
   import package_125.name_2908;
   import package_125.name_366;
   import package_125.name_369;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_2248
   {
       
      
      private var form:name_2908;
      
      private var service:name_369;
      
      public function name_2248()
      {
         super();
         this.service = new name_369();
         Main.osgi.name_1(name_366,this.service);
         this.service.addEventListener(name_1576.name_1577,this.method_2726);
         this.service.addEventListener(name_1576.name_1578,this.method_2727);
      }
      
      public function method_2726(param1:name_1576) : void
      {
         this.form.name_2911();
      }
      
      public function method_2727(param1:name_1576) : void
      {
         this.form.name_2913();
      }
      
      public function name_2253() : name_2908
      {
         if(!this.form)
         {
            this.createForm();
         }
         return this.form;
      }
      
      private function createForm() : void
      {
         this.form = new name_2908();
         this.form.addEventListener(SendPromoCodeEvent.name_2910,this.method_2728);
      }
      
      private function method_2728(param1:SendPromoCodeEvent) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;try_activate_promocode;" + param1.name_2912());
      }
      
      public function destroy() : void
      {
         if(Boolean(this.form))
         {
            this.form.removeEventListener(SendPromoCodeEvent.name_2910,this.method_2728);
         }
         this.form = null;
         Main.osgi.name_48(name_366);
         this.service.removeEventListener(name_1576.name_1577,this.method_2726);
         this.service.removeEventListener(name_1576.name_1578,this.method_2727);
         this.service = null;
      }
   }
}
