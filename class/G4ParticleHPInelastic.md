<!-- G4ParticleHPInelastic.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:24:16 2018 (+0800)
;; Last-Updated: 五 8月 10 07:25:11 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPInelastic

**public G4HadronicInteraction**



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
