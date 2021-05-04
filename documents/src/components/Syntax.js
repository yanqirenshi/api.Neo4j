import React from 'react';

const style = {
    display:'flex',
    alignItems: 'center',
    flexWrap: 'wrap',
    fontSize: 18,
    padding: '11px 22px 11px 11px',
    background: 'rgba(0, 123, 67, 0.1)',
    borderRadius: '5px',
    fontWeight: 'bold',
    element: {
        margin: 0,
        marginLeft: 11,
    },
    keyword: {
        margin: 0,
        marginLeft: 11,
        fontWeight: 'normal',
    },
};


export default function Syntax (props) {
    const keys = props.keys;

    return (
        <div style={style}>
          <p style={style.element}>{props.symbol}</p>

          {keys &&
           <>
             <p style={style.keyword}>&key</p>
             {keys.map(d=><p key={d} style={style.element}>{d}</p>)}
           </>}

          <p style={style.keyword}>⇒</p>

          <p style={style.element}>result</p>
        </div>
    );
}
