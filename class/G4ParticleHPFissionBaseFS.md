<!-- G4ParticleHPFissionBaseFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:27:21 2018 (+0800)
;; Last-Updated: 日 9月  2 10:56:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFissionBaseFS

**public G4ParticleHPFinalState**

读取高精度参数

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & bit, G4ParticleDefinition*);

  G4DynamicParticleVector * ApplyYourself(G4int Prompt);
```


```
  G4ParticleHPEnergyDistribution theEnergyDistribution;
  G4ParticleHPAngular theAngularDistribution;
```


## class

```cpp
   struct toBeCached {
      const G4ReactionProduct* theNeutronRP;
      const G4ReactionProduct* theTarget;
      toBeCached() : theNeutronRP(NULL),theTarget(NULL){};
   };

  public:
  
  G4ParticleHPFissionBaseFS()
  { 
    hasXsec = true; 
    theXsection = new G4ParticleHPVector;
  }
  virtual ~G4ParticleHPFissionBaseFS()
  {
    delete theXsection;
  }

  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & bit, G4ParticleDefinition*);

  G4DynamicParticleVector * ApplyYourself(G4int Prompt);

  virtual G4double GetXsec(G4double anEnergy)
  {
    return std::max(0., theXsection->GetY(anEnergy));
  }
  virtual G4ParticleHPVector * GetXsec() { return theXsection; }

  inline void SetNeutronRP(const G4ReactionProduct & aNeutron)
                        { 
                          fCache.Get().theNeutronRP = &aNeutron;
                          theAngularDistribution.SetProjectileRP(aNeutron);
                        }
  
  inline void SetTarget(const G4ReactionProduct & aTarget)
                        { 
                          fCache.Get().theTarget = &aTarget; 
                          theAngularDistribution.SetTarget(aTarget);
                        }
  
  private:
  
  G4HadFinalState * ApplyYourself(const G4HadProjectile & ) {return 0;}
  
  G4ParticleHPVector * theXsection;
  G4ParticleHPEnergyDistribution theEnergyDistribution;
  G4ParticleHPAngular theAngularDistribution;
  
  //G4ReactionProduct theNeutronRP;
  //G4ReactionProduct theTarget;
   private:
      G4Cache<toBeCached> fCache;

  private:
```

<!-- G4ParticleHPFissionBaseFS.md ends here -->
