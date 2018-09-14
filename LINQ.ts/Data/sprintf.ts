﻿namespace data.sprintf {

    export class match {

        public match: string;
        public left: boolean;
        public sign: string;
        public pad: string;
        public min: string;
        public precision: string;
        public code: string;
        public negative: boolean;
        public argument: string;

        public toString(): string {
            return JSON.stringify(this);
        }
    }

    /**
     * 占位符
    */
    export const placeholder: RegExp = new RegExp(/(%([%]|(\-)?(\+|\x20)?(0)?(\d+)?(\.(\d)?)?([bcdfosxX])))/g);

    export function parseFormat(string: string) {
        var stringPosStart = 0;
        var stringPosEnd = 0;
        var matchPosEnd = 0;
        var convCount = 0;
        var match: RegExpExecArray = null;
        var matches: sprintf.match[] = [];
        var strings: string[] = [];

        while (match = placeholder.exec(string)) {
            if (match[9]) {
                convCount += 1;
            }

            stringPosStart = matchPosEnd;
            stringPosEnd = placeholder.lastIndex - match[0].length;
            strings[strings.length] = string.substring(stringPosStart, stringPosEnd);

            matchPosEnd = placeholder.lastIndex;
            matches[matches.length] = <sprintf.match>{
                match: match[0],
                left: match[3] ? true : false,
                sign: match[4] || '',
                pad: match[5] || ' ',
                min: match[6] || 0,
                precision: match[8],
                code: match[9] || '%',
                negative: parseInt(arguments[convCount]) < 0 ? true : false,
                argument: String(arguments[convCount])
            };
        }

        strings[strings.length] = string.substring(matchPosEnd);

        return {
            matches: matches,
            convCount: convCount,
            strings: strings
        }
    }

    /**
     *  Javascript sprintf
     *  http://www.webtoolkit.info/javascript-sprintf.html#.W5sf9FozaM8
    */
    export function doFormat(): string {

        if (typeof arguments == "undefined") { return null; }
        if (arguments.length < 1) { return null; }
        if (typeof arguments[0] != "string") { return null; }
        if (typeof RegExp == "undefined") { return null; }

        var parsed = sprintf.parseFormat(<string>arguments[0]);
        var convCount: number = parsed.convCount;

        if (parsed.matches.length == 0) {
            return <string>arguments[0];
        }
        if ((arguments.length - 1) < convCount) {
            return "";
        } else {
            return sprintf.doSubstitute(
                parsed.matches,
                parsed.strings
            );
        }
    }

    export function doSubstitute(matches: sprintf.match[], strings: string[]): string {
        var i: number = null;
        var substitution: string = null;
        var numVal: number = 0;
        var newString = '';

        for (i = 0; i < matches.length; i++) {

            if (matches[i].code == '%') {
                substitution = '%'
            } else if (matches[i].code == 'b') {
                matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(2));
                substitution = sprintf.convert(matches[i], true);
            } else if (matches[i].code == 'c') {
                numVal = Math.abs(parseInt(matches[i].argument));
                matches[i].argument = String(String.fromCharCode(parseInt(String(numVal))));
                substitution = sprintf.convert(matches[i], true);
            } else if (matches[i].code == 'd') {
                matches[i].argument = String(Math.abs(parseInt(matches[i].argument)));
                substitution = sprintf.convert(matches[i]);
            } else if (matches[i].code == 'f') {
                numVal = matches[i].precision ? parseFloat(matches[i].precision) : 6;
                matches[i].argument = String(Math.abs(parseFloat(matches[i].argument)).toFixed(numVal));
                substitution = sprintf.convert(matches[i]);
            } else if (matches[i].code == 'o') {
                matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(8));
                substitution = sprintf.convert(matches[i]);
            } else if (matches[i].code == 's') {
                numVal = matches[i].precision ?
                    parseFloat(matches[i].precision) :
                    matches[i].argument.length;
                matches[i].argument = matches[i].argument.substring(0, numVal);
                substitution = sprintf.convert(matches[i], true);
            } else if (matches[i].code == 'x') {
                matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(16));
                substitution = sprintf.convert(matches[i]);
            } else if (matches[i].code == 'X') {
                matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(16));
                substitution = sprintf.convert(matches[i]).toUpperCase();
            } else {
                substitution = matches[i].match;
            }

            newString += strings[i];
            newString += substitution;
        }

        return newString + strings[i];
    }

    export function convert(match: sprintf.match, nosign: boolean = false): string {
        if (nosign) {
            match.sign = '';
        } else {
            match.sign = match.negative ? '-' : match.sign;
        }

        var l: number = parseFloat(match.min) - match.argument.length + 1 - match.sign.length;
        var pad = new Array(l < 0 ? 0 : l).join(match.pad);

        if (!match.left) {
            if (match.pad == "0" || nosign) {
                return match.sign + pad + match.argument;
            } else {
                return pad + match.sign + match.argument;
            }
        } else {
            if (match.pad == "0" || nosign) {
                return match.sign + match.argument + pad.replace(/0/g, ' ');
            } else {
                return match.sign + match.argument + pad;
            }
        }
    }
}