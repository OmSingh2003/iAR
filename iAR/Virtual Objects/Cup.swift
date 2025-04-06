//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import Foundation

class Cup: VirtualObject {

	override init() {
		super.init(modelName: "cup", fileExtension: "scn", thumbImageFilename: "cup", title: "Cup")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
