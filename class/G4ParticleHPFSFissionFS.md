<!-- G4ParticleHPFSFissionFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:44:23 2018 (+0800)
;; Last-Updated: 日 9月  2 11:07:45 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFSFissionFS

**public G4ParticleHPFinalState**

读取高精度参数

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
```

- "/FS/"

```
  G4ParticleHPParticleYield theFinalStateNeutrons;
  G4ParticleHPEnergyDistribution thePromptNeutronEnDis;
  G4ParticleHPEnergyDistribution theDelayedNeutronEnDis;
  G4ParticleHPAngular theNeutronAngularDis;
  G4ParticleHPPhotonDist theFinalStatePhotons;
  G4ParticleHPFissionERelease theEnergyRelease;
```


## class

```cpp
   struct toBeCached {
      const G4ReactionProduct* theNeutronRP;
      const G4ReactionProduct* theTarget;
      toBeCached() : theNeutronRP(NULL),theTarget(NULL){};
   };

  public:
  
  G4ParticleHPFSFissionFS(){ hasXsec = true; }
  ~G4ParticleHPFSFissionFS(){}
  
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  
  G4DynamicParticleVector * ApplyYourself(G4int Prompt, G4int delayed, G4double *decayconst);
  
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPFSFissionFS * theNew = new G4ParticleHPFSFissionFS;
   return theNew;
  }
  
  inline G4double GetMass(){ return theFinalStateNeutrons.GetTargetMass(); }
  
  void SampleNeutronMult(G4int&all, 
	  		 G4int&Prompt, 
			 G4int&delayed, 
			 G4double energy,
			 G4int off);
						 
  inline void SetNeutronRP(const G4ReactionProduct & aNeutron)
                        { 
                          fCache.Get().theNeutronRP = &aNeutron; 
                          theNeutronAngularDis.SetProjectileRP(aNeutron);
                        }
  
  inline void SetTarget(const G4ReactionProduct & aTarget)
                        { 
                          fCache.Get().theTarget = &aTarget; 
                          theNeutronAngularDis.SetTarget(aTarget);
                        }
    
  G4DynamicParticleVector * GetPhotons();
  
  inline G4ParticleHPFissionERelease * GetEnergyRelease()
  {
    return &theEnergyRelease;
  }
  
  private:

  G4HadFinalState * ApplyYourself(const G4HadProjectile & ) { return 0; }  
  //G4double targetMass;
  
  G4ParticleHPParticleYield theFinalStateNeutrons;
  G4ParticleHPEnergyDistribution thePromptNeutronEnDis;
  G4ParticleHPEnergyDistribution theDelayedNeutronEnDis;
  G4ParticleHPAngular theNeutronAngularDis;
  
  G4ParticleHPPhotonDist theFinalStatePhotons;
  G4ParticleHPFissionERelease theEnergyRelease;
  
  //G4ReactionProduct theNeutronRP;
  //G4ReactionProduct theTarget;
   private:
      G4Cache<toBeCached> fCache;
  
  private:
  
  G4ParticleHPNames theNames;
```

<!-- G4ParticleHPFSFissionFS.md ends here -->
