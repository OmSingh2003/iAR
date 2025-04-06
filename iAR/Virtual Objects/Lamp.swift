//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import Foundation
import ARKit

class Lamp: VirtualObject {

	override init() {
		super.init(modelName: "lamp", fileExtension: "scn", thumbImageFilename: "lamp", title: "Lamp")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
