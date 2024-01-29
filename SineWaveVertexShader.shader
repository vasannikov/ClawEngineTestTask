Shader "Custom/SineWaveVertexShader"
{
    Properties
    {
        _Amplitude ("Amplitude", Range(0.1, 10)) = 1.0  // Параметр амплитуды с возможностью настройки
        _Speed ("Speed", Range(0.1, 10)) = 1.0         // Параметр скорости сдвига по фазе с возможностью настройки
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            // Берем данные о вершинах из вершинного шейдера
            struct appdata_t
            {
                float4 vertex : POSITION;
            };
            
            // Берем данные о вершинах после их преобразования
            struct v2f
            {
                float4 vertex : SV_POSITION;
            };
            
            // Параметры из пользовательских свойств
            float _Amplitude;
            float _Speed;
            
            // Функция для смещения вершин с помощью синусоиды
            v2f vert (appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                float wave = sin(_Time.y * _Speed + v.vertex.x) * _Amplitude; // вычисление синусоидального смещения
                o.vertex.y += wave; // смещение вершины в направлении оси Y
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1, 1, 1, 1);
            }
            ENDCG
        }
    }
}
