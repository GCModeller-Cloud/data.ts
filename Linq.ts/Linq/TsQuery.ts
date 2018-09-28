﻿

namespace Linq.TsQuery {

    export const handler = {
        /**
         * HTML document query handler
        */
        string: () => new stringEval(),
        /**
         * Create a linq object
        */
        array: () => new arrayEval()
    };

    export interface IEval<T> {
        doEval(expr: T, type: TypeInfo): any;
    }

    /**
     * 字符串格式的值意味着对html文档节点的查询
    */
    export class stringEval implements IEval<string> {

        doEval(expr: string, type: TypeInfo): any {
            var query: DOM.Query = DOM.Query.parseQuery(expr);

            if (query.type == DOM.QueryTypes.id) {
                // 按照id查询
                return document.getElementById(query.expression);
            } else if (query.type == DOM.QueryTypes.NoQuery) {
                // 创建新的节点元素
                var declare = DOM.ParseNodeDeclare(expr);
                var node: HTMLElement = document
                    .createElement(declare.tag);

                declare.attrs.forEach(attr => {
                    node.setAttribute(attr.name, attr.value);
                });

                return node;
            } else if (!query.singleNode) {
                // 返回节点集合
                var nodes = <NodeListOf<HTMLElement>>document
                    .querySelectorAll(query.expression);
                var it = new DOM.DOMEnumerator(nodes);

                return it;
            } else {
                // 只返回第一个满足条件的节点
                return document.querySelector(query.expression);
            }
        }
    }
       
    /**
     * Create a Linq Enumerator
    */
    export class arrayEval<V> implements IEval<V[]> {

        doEval(expr: V[], type: TypeInfo): any {
            return From(expr);
        }
    }
}