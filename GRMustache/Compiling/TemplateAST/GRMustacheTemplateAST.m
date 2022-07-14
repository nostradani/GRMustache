// The MIT License
//
// Copyright (c) 2014 Gwendal Roué
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if !__has_feature(objc_arc)
#error Automatic Reference Counting required: use -fobjc-arc.
#endif

#import "GRMustacheTemplateAST_private.h"
#import "GRMustacheTemplateASTNode_private.h"
#import "GRMustacheTemplateASTVisitor_private.h"

@implementation GRMustacheTemplateAST


+ (instancetype)placeholderAST
{
    return [[self alloc] initWithASTNodes:nil contentType:GRMustacheContentTypeHTML];
}

+ (instancetype)templateASTWithASTNodes:(NSArray *)templateASTNodes contentType:(GRMustacheContentType)contentType
{
    NSAssert(templateASTNodes, @"nil templateASTNodes");
    return [[self alloc] initWithASTNodes:templateASTNodes contentType:contentType];
}

- (BOOL)isPlaceholder
{
    return (_templateASTNodes == nil);
}

- (instancetype)initWithASTNodes:(NSArray *)templateASTNodes contentType:(GRMustacheContentType)contentType
{
    self = [super init];
    if (self) {
        _templateASTNodes = templateASTNodes;
        _contentType = contentType;
    }
    return self;
}


#pragma mark - <GRMustacheTemplateASTNode>

- (BOOL)acceptTemplateASTVisitor:(id<GRMustacheTemplateASTVisitor>)visitor error:(NSError **)error
{
    return [visitor visitTemplateAST:self error:error];
}

- (id<GRMustacheTemplateASTNode>)resolveTemplateASTNode:(id<GRMustacheTemplateASTNode>)templateASTNode
{
    return templateASTNode;
}

@end