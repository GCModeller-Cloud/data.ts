﻿/// <reference path="Linq/Enumerator.ts" />

function From<T>(source: T[]): IEnumerator<T> {
    return new IEnumerator<T>(source);
}

function IsNullOrEmpty<T>(array: T[]): boolean {
    if (array == null || array == undefined) {
        return true;
    } else if (array.length == 0) {
        return true;
    } else {
        return false;
    }
}
}

module DataExtensions {

    export function as_numeric(obj: any): number {
        if (typeof obj === 'number') {
            return <number>obj;
        } else if (typeof obj === 'boolean') {
            if (obj == true) {
                return 1;
            } else {
                return -1;
            }
        } else if (typeof obj == 'undefined') {
            return 0;
        } else if (typeof obj == 'string') {
            return parseFloat(<string>obj);
        } else {
            return 0;
        }
    }
}