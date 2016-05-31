//
//  Notebook+CoreDataProperties.h
//  SuperNote
//
//  Created by hussein albazaz on 5/30/16.
//  Copyright © 2016 hussein. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Notebook.h"

NS_ASSUME_NONNULL_BEGIN

@interface Notebook (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
