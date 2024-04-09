package package_380
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.gui.name_3294;
   import controls.buttons.class_163;
   import controls.buttons.h30px.H30ButtonSkin;
   import controls.buttons.name_2717;
   import package_178.name_1860;
   import package_178.name_542;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class name_2716 extends class_163
   {
      
      public static var var_2550:name_542 = OSGi.getInstance().getService(name_542) as name_542;
      
      private static const const_2587:int = -16;
      
      private static const const_2588:int = -4;
       
      
      private var var_2565:QuestTypeEnum;
      
      private var indicator:name_3294;
      
      public function name_2716(param1:QuestTypeEnum, param2:String)
      {
         super(new name_2717());
         this.var_2565 = param1;
         method_1961 = H30ButtonSkin.name_2261;
         method_1962 = H30ButtonSkin.name_2260;
         method_1963 = H30ButtonSkin.name_2262;
         this.label = param2;
         buttonMode = true;
         useHandCursor = true;
         this.indicator = new name_3294();
         var_2550.addEventListener(name_1860.name_1859,this.method_3009);
         var_2550.addEventListener(name_1860.name_1847,this.method_3008);
         addChild(this.indicator);
         this.indicator.visible = var_2550.method_1364(param1);
         this.indicator.x = width + -16;
         this.indicator.y = -4;
      }
      
      public function getQuestType() : QuestTypeEnum
      {
         return this.var_2565;
      }
      
      private function method_3009(param1:name_1860) : void
      {
         if(param1.var_2565 == this.var_2565)
         {
            this.indicator.visible = true;
         }
      }
      
      private function method_3008(param1:name_1860) : void
      {
         if(param1.var_2565 == this.var_2565)
         {
            this.indicator.visible = false;
         }
      }
   }
}
