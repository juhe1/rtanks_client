package package_1
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.weapon.healing.HealingGunModel;
   import alternativa.tanks.models.weapon.machinegun.MachineGunModel;
   import package_149.FreezeModel;
   import package_149.FreezeSFXModel;
   import package_150.LongTermBonusModel;
   import package_151.RicochetModel;
   import package_152.RicochetSFXModel;
   import package_153.PlasmaSFXModel;
   import package_154.PlasmaModel;
   import package_155.FlamethrowerSFXModel;
   import package_156.CrystalBonusModel;
   import package_157.RailgunSFXModel;
   import package_158.RailgunModel;
   import package_159.ColorTransformModel;
   import package_160.FirstAidModel;
   import package_161.WeaponWeakeningModel;
   import package_162.SmokySFXModel;
   import package_163.FlamethrowerModel;
   import package_164.ThunderModel;
   import package_165.ThunderSFXModel;
   import package_166.HealingGunSFXModel;
   import package_167.ShotModel;
   import package_168.SmokyModel;
   import package_92.WeaponCommonModel;
   import package_97.BonusCommonModel;
   
   public class TanksWarfareActivator extends CommonBundleActivator
   {
       
      
      public function TanksWarfareActivator()
      {
         super();
      }
      
      override public function start(param1:OSGi) : void
      {
         method_117(new FirstAidModel(),param1);
         method_117(new BonusCommonModel(),param1);
         method_117(new LongTermBonusModel(),param1);
         method_117(new CrystalBonusModel(),param1);
         method_117(new WeaponCommonModel(),param1);
         method_117(new WeaponWeakeningModel(),param1);
         method_117(new ShotModel(),param1);
         method_117(new SmokyModel(),param1);
         method_117(new SmokySFXModel(),param1);
         method_117(new PlasmaModel(),param1);
         method_117(new PlasmaSFXModel(),param1);
         method_117(new FlamethrowerModel(),param1);
         method_117(new FlamethrowerSFXModel(),param1);
         method_117(new RailgunModel(),param1);
         method_117(new RailgunSFXModel(),param1);
         method_117(new HealingGunModel(),param1);
         method_117(new HealingGunSFXModel(),param1);
         method_117(new ThunderModel(),param1);
         method_117(new ThunderSFXModel(),param1);
         method_117(new RicochetModel(),param1);
         method_117(new RicochetSFXModel(),param1);
         method_117(new MachineGunModel(),param1);
         method_117(new FreezeModel(),param1);
         method_117(new FreezeSFXModel(),param1);
         method_117(new ColorTransformModel(),param1);
      }
   }
}
