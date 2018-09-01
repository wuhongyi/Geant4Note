<!-- G4ParticleHPInelasticCompFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 23:47:42 2018 (+0800)
;; Last-Updated: 日 9月  2 00:08:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 4
;; URL: http://wuhongyi.cn -->

# G4ParticleHPInelasticCompFS

**public G4ParticleHPFinalState**

**读取高精度数据(角分布、gamma)**

```cpp
void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aSFType, G4ParticleDefinition*);
```

- dataType==3
	- G4ParticleHPVector
- dataType==4
	- G4ParticleHPAngular
- dataType==5
	- G4ParticleHPEnergyDistribution
- dataType==6
	- G4ParticleHPEnAngCorrelation
- dataType==12
	- G4ParticleHPPhotonDist
- dataType==13
	- G4ParticleHPPhotonDist
- dataType==14
- dataType==15



```
getenv("G4NEUTRONHPDATA")

"/Inelastic/Gammas/"
```

## class

```cpp
  public:
  
  G4ParticleHPInelasticCompFS()
  {

    QI.resize(51);
    LR.resize(51);
    for(G4int i=0; i<51; i++)
    {
      hasXsec = true; 
      theXsection[i] = 0;
      theEnergyDistribution[i] = 0;
      theAngularDistribution[i] = 0;
      theEnergyAngData[i] = 0;
      theFinalStatePhotons[i] = 0;
      QI[i]=0.0;
      LR[i]=0;
    }

  }
  virtual ~G4ParticleHPInelasticCompFS()
  {
    for(G4int i=0; i<51; i++)
    {
      if(theXsection[i] != 0) delete theXsection[i];
      if(theEnergyDistribution[i] != 0) delete theEnergyDistribution[i];
      if(theAngularDistribution[i] != 0) delete theAngularDistribution[i];
      if(theEnergyAngData[i] != 0) delete theEnergyAngData[i];
      if(theFinalStatePhotons[i] != 0) delete theFinalStatePhotons[i];
    }
  }
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aSFType, G4ParticleDefinition*);
  void InitGammas(G4double AR, G4double ZR);
  virtual G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack) = 0;
  virtual G4ParticleHPFinalState * New() = 0;
  virtual G4double GetXsec(G4double anEnergy)
  {
    return std::max(0., theXsection[50]->GetY(anEnergy));
  }
  virtual G4ParticleHPVector * GetXsec() { return theXsection[50]; }
  G4int SelectExitChannel(G4double eKinetic);
  void CompositeApply(const G4HadProjectile & theTrack, G4ParticleDefinition * aHadron);
  inline void InitDistributionInitialState(G4ReactionProduct & anIncidentPart, 
                                           G4ReactionProduct & aTarget, 
                                           G4int it)
  {
    if(theAngularDistribution[it]!=0) 
    {
      theAngularDistribution[it]->SetTarget(aTarget);
      theAngularDistribution[it]->SetProjectileRP(anIncidentPart);
    }
    if(theEnergyAngData[it]!=0)
    {
      theEnergyAngData[it]->SetTarget(aTarget);
      theEnergyAngData[it]->SetProjectileRP(anIncidentPart);
    }
  }
  
protected:
  
  G4ParticleHPVector * theXsection[51];
  G4ParticleHPEnergyDistribution * theEnergyDistribution[51];
  G4ParticleHPAngular * theAngularDistribution[51];
  G4ParticleHPEnAngCorrelation * theEnergyAngData[51];
  
  G4ParticleHPPhotonDist * theFinalStatePhotons[51];
  
  G4ParticleHPDeExGammas theGammas;
  G4String gammaPath;
  
  //G4double theCurrentA;
  //G4double theCurrentZ;

   protected:
      std::vector < G4double >  QI;
      std::vector <G4int > LR;

   private:
      //                       proj                 targ                 had                  mu of had   
      void two_body_reaction ( G4DynamicParticle* , G4DynamicParticle* , G4DynamicParticle* , G4double mu ); 

      G4NRESP71M03 nresp71_model;
      G4bool use_nresp71_model( const G4ParticleDefinition* aDefinition, const G4int it , const G4ReactionProduct& theTarget , G4ReactionProduct& boosted);
```

<!-- G4ParticleHPInelasticCompFS.md ends here -->
