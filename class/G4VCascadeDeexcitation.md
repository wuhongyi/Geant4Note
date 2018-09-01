<!-- G4VCascadeDeexcitation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 11:59:36 2018 (+0800)
;; Last-Updated: 六 9月  1 12:00:34 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VCascadeDeexcitation

**public G4VCascadeCollider**

Base class to define a common interface for post-cascade processing.

## class

```cpp
public:
  G4VCascadeDeexcitation(const G4String& name) : G4VCascadeCollider(name) {}
  virtual ~G4VCascadeDeexcitation() {}

  // Standard Collider interface should not be used (will end job)
  virtual void collide(G4InuclParticle* bullet, G4InuclParticle* target,
		       G4CollisionOutput& globalOutput);

  // Interface specific to pre-compound (post-cascade) processing
  virtual void deExcite(const G4Fragment& fragment,
			G4CollisionOutput& output) = 0;

private:
  // Copying of modules is forbidden
  G4VCascadeDeexcitation(const G4VCascadeDeexcitation&);
  G4VCascadeDeexcitation& operator=(const G4VCascadeDeexcitation&);
```

<!-- G4VCascadeDeexcitation.md ends here -->
