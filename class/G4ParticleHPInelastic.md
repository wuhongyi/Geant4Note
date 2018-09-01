<!-- G4ParticleHPInelastic.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:24:16 2018 (+0800)
;; Last-Updated: 六 9月  1 23:38:05 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4ParticleHPInelastic

**public G4HadronicInteraction**

- Final state production model for a high precision (based on evaluated data libraries) description of neutron inelastic scattering below 20 MeV; 
- 36 exclusive final states are consideded.
- To be used in your physics list in case you need this physics.
- In this case you want to register an object of this class with the corresponding process.


```
getenv("G4PARTICLEHPDATA")
getenv( "G4PARTICLEHPDATA" )

dataDirVariable = "G4NEUTRONHPDATA";
dataDirVariable = "G4PROTONHPDATA";
dataDirVariable = "G4DEUTERONHPDATA";
dataDirVariable = "G4TRITONHPDATA";
dataDirVariable = "G4HE3HPDATA";
dataDirVariable = "G4ALPHAHPDATA";
```

```
((*theInelastic)[i])->Register( new G4ParticleHPNInelasticFS , "F01"); // has
((*theInelastic)[i])->Register( new G4ParticleHPNXInelasticFS , "F02");
((*theInelastic)[i])->Register( new G4ParticleHP2NDInelasticFS , "F03");
((*theInelastic)[i])->Register( new G4ParticleHP2NInelasticFS , "F04"); // has, E Done
((*theInelastic)[i])->Register( new G4ParticleHP3NInelasticFS , "F05"); // has, E Done
((*theInelastic)[i])->Register( new G4ParticleHPNAInelasticFS , "F06");
((*theInelastic)[i])->Register( new G4ParticleHPN3AInelasticFS , "F07");
((*theInelastic)[i])->Register( new G4ParticleHP2NAInelasticFS , "F08");
((*theInelastic)[i])->Register( new G4ParticleHP3NAInelasticFS , "F09");
((*theInelastic)[i])->Register( new G4ParticleHPNPInelasticFS , "F10");
((*theInelastic)[i])->Register( new G4ParticleHPN2AInelasticFS , "F11");
((*theInelastic)[i])->Register( new G4ParticleHP2N2AInelasticFS , "F12");
((*theInelastic)[i])->Register( new G4ParticleHPNDInelasticFS , "F13");
((*theInelastic)[i])->Register( new G4ParticleHPNTInelasticFS , "F14");
((*theInelastic)[i])->Register( new G4ParticleHPNHe3InelasticFS , "F15");
((*theInelastic)[i])->Register( new G4ParticleHPND2AInelasticFS , "F16");
((*theInelastic)[i])->Register( new G4ParticleHPNT2AInelasticFS , "F17");
((*theInelastic)[i])->Register( new G4ParticleHP4NInelasticFS , "F18"); // has, E Done
((*theInelastic)[i])->Register( new G4ParticleHP2NPInelasticFS , "F19");
((*theInelastic)[i])->Register( new G4ParticleHP3NPInelasticFS , "F20");
((*theInelastic)[i])->Register( new G4ParticleHPN2PInelasticFS , "F21");
((*theInelastic)[i])->Register( new G4ParticleHPNPAInelasticFS , "F22");
((*theInelastic)[i])->Register( new G4ParticleHPPInelasticFS , "F23");
((*theInelastic)[i])->Register( new G4ParticleHPDInelasticFS , "F24");
((*theInelastic)[i])->Register( new G4ParticleHPTInelasticFS , "F25");
((*theInelastic)[i])->Register( new G4ParticleHPHe3InelasticFS , "F26");
((*theInelastic)[i])->Register( new G4ParticleHPAInelasticFS , "F27");
((*theInelastic)[i])->Register( new G4ParticleHP2AInelasticFS , "F28");
((*theInelastic)[i])->Register( new G4ParticleHP3AInelasticFS , "F29");
((*theInelastic)[i])->Register( new G4ParticleHP2PInelasticFS , "F30");
((*theInelastic)[i])->Register( new G4ParticleHPPAInelasticFS , "F31");
((*theInelastic)[i])->Register( new G4ParticleHPD2AInelasticFS , "F32");
((*theInelastic)[i])->Register( new G4ParticleHPT2AInelasticFS , "F33");
((*theInelastic)[i])->Register( new G4ParticleHPPDInelasticFS , "F34");
((*theInelastic)[i])->Register( new G4ParticleHPPTInelasticFS , "F35");
((*theInelastic)[i])->Register( new G4ParticleHPDAInelasticFS , "F36");
```



## class

```cpp
  public: 

  G4ParticleHPInelastic(G4ParticleDefinition* projectile = G4Neutron::Neutron(), const char* name = "NeutronHPInelastic" );

  ~G4ParticleHPInelastic();
  
  G4HadFinalState * ApplyYourself(const G4HadProjectile & aTrack, G4Nucleus & aTargetNucleus);
  virtual const std::pair<G4double, G4double> GetFatalEnergyCheckLevels() const;

  public:
      G4int GetVerboseLevel() const;
      void SetVerboseLevel( G4int );
      void BuildPhysicsTable(const G4ParticleDefinition&);
      virtual void ModelDescription(std::ostream& outFile) const;

protected:
  
  //G4ParticleHPChannelList * theInelastic; // one List per element
  std::vector<G4ParticleHPChannelList*>* theInelastic; // one List per element
  G4String dataDirVariable;
  G4String dirName;
  G4int numEle;

  private:
 /* 
   G4ParticleHP2AInelasticFS the2AFS;
   G4ParticleHP2N2AInelasticFS the2N2AFS;
   G4ParticleHP2NAInelasticFS the2NAFS;
   G4ParticleHP2NDInelasticFS the2NDFS;
   G4ParticleHP2NInelasticFS the2NFS;
   G4ParticleHP2NPInelasticFS the2NPFS;
   G4ParticleHP2PInelasticFS the2PFS;
   G4ParticleHP3AInelasticFS the3AFS;
   G4ParticleHP3NAInelasticFS the3NAFS;
   G4ParticleHP3NInelasticFS the3NFS;
   G4ParticleHP3NPInelasticFS the3NPFS;
   G4ParticleHP4NInelasticFS the4NFS;
   G4ParticleHPAInelasticFS theAFS;
   G4ParticleHPD2AInelasticFS theD2AFS;
   G4ParticleHPDAInelasticFS theDAFS;
   G4ParticleHPDInelasticFS theDFS;
   G4ParticleHPHe3InelasticFS theHe3FS;
   G4ParticleHPN2AInelasticFS theN2AFS;
   G4ParticleHPN2PInelasticFS theN2PFS;
   G4ParticleHPN3AInelasticFS theN3AFS;
   G4ParticleHPNAInelasticFS theNAFS;
   G4ParticleHPND2AInelasticFS theND2AFS;
   G4ParticleHPNDInelasticFS theNDFS;
   G4ParticleHPNHe3InelasticFS theNHe3FS;
   G4ParticleHPNInelasticFS theNFS;
   G4ParticleHPNPAInelasticFS theNPAFS;
   G4ParticleHPNPInelasticFS theNPFS;
   G4ParticleHPNT2AInelasticFS theNT2AFS;
   G4ParticleHPNTInelasticFS theNTFS;
   G4ParticleHPNXInelasticFS theNXFS;
   G4ParticleHPPAInelasticFS thePAFS;
   G4ParticleHPPDInelasticFS thePDFS;
   G4ParticleHPPInelasticFS thePFS;
   G4ParticleHPPTInelasticFS thePTFS;
   G4ParticleHPT2AInelasticFS theT2AFS;
   G4ParticleHPTInelasticFS theTFS;
*/

   G4ParticleDefinition* theProjectile;
```

<!-- G4ParticleHPInelastic.md ends here -->
