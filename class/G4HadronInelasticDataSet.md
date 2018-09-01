<!-- G4HadronInelasticDataSet.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 09:07:54 2018 (+0800)
;; Last-Updated: 六 9月  1 09:14:30 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4HadronInelasticDataSet

**public G4VCrossSectionDataSet**

Baseline data-set for  hadron inelastic cross-section. This does not need to be registered, but provides part of the general cross-section baseline 


实例化类
- G4HadronCrossSections


## class

```cpp
public:

  G4HadronInelasticDataSet(const G4String& name = "GheishaInelastic"); 

  virtual ~G4HadronInelasticDataSet();

  virtual void CrossSectionDescription(std::ostream&) const;

  virtual G4bool
  IsElementApplicable(const G4DynamicParticle* aParticle, G4int /*Z*/,
                      const G4Material*);

  virtual G4double
  GetElementCrossSection(const G4DynamicParticle* aParticle, G4int Z, 
			 const G4Material*);
private:

  G4HadronCrossSections* theHadronCrossSections;
```

<!-- G4HadronInelasticDataSet.md ends here -->
