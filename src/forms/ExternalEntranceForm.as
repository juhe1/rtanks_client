package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.name_554;
   import controls.base.LabelBase;
   import controls.containers.HorizontalStackPanel;
   import controls.name_1922;
   import controls.name_2123;
   import flash.utils.Dictionary;
   import package_268.ExternalEntranceService;
   
   public class ExternalEntranceForm extends name_1922
   {
      
      public static var var_3560:name_554 = OSGi.getInstance().getService(name_554) as name_554;
       
      
      public var name_3490:name_2123;
      
      private var var_1826:LabelBase;
      
      private var var_3700:HorizontalStackPanel;
      
      private var buttons:Dictionary;
      
      public function ExternalEntranceForm(param1:int, param2:int, param3:String)
      {
         var _loc4_:* = null;
         this.name_3490 = new name_2123();
         this.var_3700 = new HorizontalStackPanel();
         this.buttons = new Dictionary();
         super(param1,param2);
         this.var_1826 = new LabelBase();
         this.var_1826.text = param3;
         this.var_1826.y = 15;
         this.var_1826.x = param1 / 2 - this.var_1826.width / 2;
         addChild(this.var_1826);
         if(var_3560.method_1402)
         {
            this.buttons[ExternalEntranceService.const_1582] = this.name_3490;
         }
         this.var_3700.name_2121(5);
         for(_loc4_ in this.buttons)
         {
            this.var_3700.addItem(this.buttons[_loc4_]);
         }
         this.var_3700.y = 35;
         this.var_3700.x = param1 / 2 - this.var_3700.width / 2;
         addChild(this.var_3700);
      }
   }
}
